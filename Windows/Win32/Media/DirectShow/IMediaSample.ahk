#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\MediaFoundation\AM_MEDIA_TYPE.ahk" { AM_MEDIA_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IMediaSample interface sets and retrieves properties on media samples.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-imediasample
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IMediaSample extends IUnknown {
    /**
     * The interface identifier for IMediaSample
     * @type {Guid}
     */
    static IID := Guid("{56a8689a-0ad4-11ce-b03a-0020af0ba770}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMediaSample interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPointer          : IntPtr
        GetSize             : IntPtr
        GetTime             : IntPtr
        SetTime             : IntPtr
        IsSyncPoint         : IntPtr
        SetSyncPoint        : IntPtr
        IsPreroll           : IntPtr
        SetPreroll          : IntPtr
        GetActualDataLength : IntPtr
        SetActualDataLength : IntPtr
        GetMediaType        : IntPtr
        SetMediaType        : IntPtr
        IsDiscontinuity     : IntPtr
        SetDiscontinuity    : IntPtr
        GetMediaTime        : IntPtr
        SetMediaTime        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMediaSample.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetPointer method retrieves a read/write pointer to the media sample's buffer.
     * @remarks
     * The buffer memory is owned by the media sample object, and is automatically released when the media sample is destroyed. The caller should not free or reallocate the buffer.
     * @returns {Pointer<Integer>} Receives a pointer to the buffer.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-getpointer
     */
    GetPointer() {
        result := ComCall(3, this, "ptr*", &ppBuffer := 0, "HRESULT")
        return ppBuffer
    }

    /**
     * The GetSize method retrieves the size of the buffer.
     * @returns {Integer} Returns the size of the buffer, in bytes. The size does not include the prefix bytes, if any.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-getsize
     */
    GetSize() {
        result := ComCall(4, this, Int32)
        return result
    }

    /**
     * The GetTime method retrieves the stream times at which this sample should begin and finish.
     * @remarks
     * Both time values are relative to the stream time. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/time-and-clocks-in-directshow">Time and Clocks in DirectShow</a>.
     * @param {Pointer<Integer>} pTimeStart Pointer to a variable that receives the start time.
     * @param {Pointer<Integer>} pTimeEnd Pointer to a variable that receives the stop time. If the sample has no stop time, the value is set to the start time plus one.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success. The sample has valid start and stop times.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_S_NO_STOP_TIME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sample has a valid start time, but no stop time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_SAMPLE_TIME_NOT_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sample is not time-stamped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-gettime
     */
    GetTime(pTimeStart, pTimeEnd) {
        pTimeStartMarshal := pTimeStart is VarRef ? "int64*" : "ptr"
        pTimeEndMarshal := pTimeEnd is VarRef ? "int64*" : "ptr"

        result := ComCall(5, this, pTimeStartMarshal, pTimeStart, pTimeEndMarshal, pTimeEnd, "HRESULT")
        return result
    }

    /**
     * The SetTime method sets the stream times when this sample should begin and finish.
     * @remarks
     * Both time values are relative to the stream time. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/time-and-clocks-in-directshow">Time and Clocks in DirectShow</a>.
     * 
     * To invalidate the stream times, set <i>pTimeStart</i> and <i>pTimeEnd</i> to <b>NULL</b>. This will cause the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediasample-gettime">IMediaSample::GetTime</a> method to return VFW_E_SAMPLE_TIME_NOT_SET.
     * 
     * For more information about stream times, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/time-and-clocks-in-directshow">Time and Clocks in DirectShow</a>.
     * @param {Pointer<Integer>} pTimeStart Pointer to a variable that contains the start time of the sample.
     * @param {Pointer<Integer>} pTimeEnd Pointer to a variable that contains the stop time of the sample.
     * @returns {HRESULT} Returns S_OK, or <b>HRESULT</b> value indicating the cause of the error.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-settime
     */
    SetTime(pTimeStart, pTimeEnd) {
        pTimeStartMarshal := pTimeStart is VarRef ? "int64*" : "ptr"
        pTimeEndMarshal := pTimeEnd is VarRef ? "int64*" : "ptr"

        result := ComCall(6, this, pTimeStartMarshal, pTimeStart, pTimeEndMarshal, pTimeEnd, "HRESULT")
        return result
    }

    /**
     * The IsSyncPoint method determines if the beginning of this sample is a synchronization point.
     * @remarks
     * A filter can begin a stream at any synchronization point. With some compression types, streaming can begin only at certain points in the stream; for example, on key frames. If the <b>bTemporalCompression</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure is <b>FALSE</b>, all samples are synchronization points.
     * @returns {HRESULT} Returns S_OK if the sample is a synchronization point. Otherwise, returns S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-issyncpoint
     */
    IsSyncPoint() {
        result := ComCall(7, this, Int32)
        return result
    }

    /**
     * The SetSyncPoint method specifies whether the beginning of this sample is a synchronization point.
     * @remarks
     * The filter that first generates the data in the sample should set this flag to <b>TRUE</b> or <b>FALSE</b>, as appropriate. For uncompressed video and PCM audio, set every sample to <b>TRUE</b>. For compressed video, set key frames to <b>TRUE</b> and delta frames to <b>FALSE</b>.
     * 
     * This flag is purely informational. Other filters downstream might check this flag; for example, a filter might need to skip to the next key frame.
     * @param {BOOL} bIsSyncPoint Boolean value that specifies whether this is a synchronization point. If <b>TRUE</b>, this is a synchronization point.
     * @returns {HRESULT} Returns S_OK or an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-setsyncpoint
     */
    SetSyncPoint(bIsSyncPoint) {
        result := ComCall(8, this, BOOL, bIsSyncPoint, "HRESULT")
        return result
    }

    /**
     * The IsPreroll method determines if this sample is a preroll sample. A preroll sample should not be displayed.
     * @remarks
     * Preroll samples are processed but not displayed. They are located in the media stream before the displayable samples.
     * @returns {HRESULT} Returns S_OK if the sample is a preroll sample. Otherwise, returns S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-ispreroll
     */
    IsPreroll() {
        result := ComCall(9, this, Int32)
        return result
    }

    /**
     * The SetPreroll method specifies whether this sample is a preroll sample.
     * @param {BOOL} bIsPreroll Boolean value that specifies whether this is a preroll sample. If <b>TRUE</b>, this is a preroll sample.
     * @returns {HRESULT} Returns S_OK, or an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-setpreroll
     */
    SetPreroll(bIsPreroll) {
        result := ComCall(10, this, BOOL, bIsPreroll, "HRESULT")
        return result
    }

    /**
     * The GetActualDataLength method retrieves the length of the valid data in the buffer.
     * @returns {Integer} Returns the length of the valid data, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-getactualdatalength
     */
    GetActualDataLength() {
        result := ComCall(11, this, Int32)
        return result
    }

    /**
     * The SetActualDataLength method sets the length of the valid data in the buffer.
     * @param {Integer} __MIDL__IMediaSample0000 Length of the data in the media sample, in bytes.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_BUFFER_OVERFLOW.</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Length specified in <i>lLen</i> is larger than the buffer size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-setactualdatalength
     */
    SetActualDataLength(__MIDL__IMediaSample0000) {
        result := ComCall(12, this, "int", __MIDL__IMediaSample0000, "HRESULT")
        return result
    }

    /**
     * The GetMediaType method retrieves the media type, if the media type differs from the previous sample.
     * @remarks
     * This method enables a filter to make limited changes to the media type, such as changing the palette. To make a significant change to the media type, the pins might need to reconnect and renegotiate the media type.
     * 
     * If the method returns S_OK, the caller must free the memory for the media type, including the format block. You can use the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/deletemediatype">DeleteMediaType</a> function in the DirectShow base class library.
     * @returns {Pointer<AM_MEDIA_TYPE>} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure. If the media type has not changed from the previous sample, <i>*ppMediaType</i> is set to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-getmediatype
     */
    GetMediaType() {
        result := ComCall(13, this, "ptr*", &ppMediaType := 0, "HRESULT")
        return ppMediaType
    }

    /**
     * The SetMediaType method sets the media type for the sample.
     * @remarks
     * By default, every sample has the same media type as the previous sample. (The pin connection determines the original media type.) Call this method to make limited changes to the media type, such as changing the palette. To make a significant change to the media type, the pins might need to reconnect and renegotiate the media type.
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that specifies the media type.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-setmediatype
     */
    SetMediaType(pMediaType) {
        result := ComCall(14, this, AM_MEDIA_TYPE.Ptr, pMediaType, "HRESULT")
        return result
    }

    /**
     * The IsDiscontinuity method determines if this sample represents a break in the data stream.
     * @remarks
     * A discontinuity occurs when a filter seeks to a different place in the stream, or when a filter drops samples for quality control.
     * @returns {HRESULT} Returns S_OK if the sample is a break in the data stream. Otherwise, returns S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-isdiscontinuity
     */
    IsDiscontinuity() {
        result := ComCall(15, this, Int32)
        return result
    }

    /**
     * The SetDiscontinuity method specifies whether this sample represents a break in the data stream.
     * @param {BOOL} bDiscontinuity Boolean value that specifies whether this sample is a discontinuity. If <b>TRUE</b>, the media sample is discontinuous with the previous sample.
     * @returns {HRESULT} Returns S_OK, or an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-setdiscontinuity
     */
    SetDiscontinuity(bDiscontinuity) {
        result := ComCall(16, this, BOOL, bDiscontinuity, "HRESULT")
        return result
    }

    /**
     * The GetMediaTime method retrieves the media times for this sample.
     * @remarks
     * For more information about media times, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/time-and-clocks-in-directshow">Time and Clocks in DirectShow</a>.
     * @param {Pointer<Integer>} pTimeStart Pointer to a variable that receives the media start time.
     * @param {Pointer<Integer>} pTimeEnd Pointer to a variable that receives the media stop time.
     * @returns {HRESULT} Returns an HRESULT value. Possible values include those shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_MEDIA_TIME_NOT_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Media times are not set on this sample.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-getmediatime
     */
    GetMediaTime(pTimeStart, pTimeEnd) {
        pTimeStartMarshal := pTimeStart is VarRef ? "int64*" : "ptr"
        pTimeEndMarshal := pTimeEnd is VarRef ? "int64*" : "ptr"

        result := ComCall(17, this, pTimeStartMarshal, pTimeStart, pTimeEndMarshal, pTimeEnd, "HRESULT")
        return result
    }

    /**
     * The SetMediaTime method sets the media times for this sample.
     * @remarks
     * To invalidate the media time, set <i>pTimeStart</i> and <i>pTimeEnd</i> to <b>NULL</b>. This will cause the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediasample-getmediatime">IMediaSample::GetMediaTime</a> method to return VFW_E_MEDIA_TIME_NOT_SET.
     * 
     * For more information about media times, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/time-stamps">Time Stamps</a>.
     * @param {Pointer<Integer>} pTimeStart Pointer to the beginning media time.
     * @param {Pointer<Integer>} pTimeEnd Pointer to the ending media time.
     * @returns {HRESULT} Returns S_OK, or an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediasample-setmediatime
     */
    SetMediaTime(pTimeStart, pTimeEnd) {
        pTimeStartMarshal := pTimeStart is VarRef ? "int64*" : "ptr"
        pTimeEndMarshal := pTimeEnd is VarRef ? "int64*" : "ptr"

        result := ComCall(18, this, pTimeStartMarshal, pTimeStart, pTimeEndMarshal, pTimeEnd, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMediaSample.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPointer := CallbackCreate(GetMethod(implObj, "GetPointer"), flags, 2)
        this.vtbl.GetSize := CallbackCreate(GetMethod(implObj, "GetSize"), flags, 1)
        this.vtbl.GetTime := CallbackCreate(GetMethod(implObj, "GetTime"), flags, 3)
        this.vtbl.SetTime := CallbackCreate(GetMethod(implObj, "SetTime"), flags, 3)
        this.vtbl.IsSyncPoint := CallbackCreate(GetMethod(implObj, "IsSyncPoint"), flags, 1)
        this.vtbl.SetSyncPoint := CallbackCreate(GetMethod(implObj, "SetSyncPoint"), flags, 2)
        this.vtbl.IsPreroll := CallbackCreate(GetMethod(implObj, "IsPreroll"), flags, 1)
        this.vtbl.SetPreroll := CallbackCreate(GetMethod(implObj, "SetPreroll"), flags, 2)
        this.vtbl.GetActualDataLength := CallbackCreate(GetMethod(implObj, "GetActualDataLength"), flags, 1)
        this.vtbl.SetActualDataLength := CallbackCreate(GetMethod(implObj, "SetActualDataLength"), flags, 2)
        this.vtbl.GetMediaType := CallbackCreate(GetMethod(implObj, "GetMediaType"), flags, 2)
        this.vtbl.SetMediaType := CallbackCreate(GetMethod(implObj, "SetMediaType"), flags, 2)
        this.vtbl.IsDiscontinuity := CallbackCreate(GetMethod(implObj, "IsDiscontinuity"), flags, 1)
        this.vtbl.SetDiscontinuity := CallbackCreate(GetMethod(implObj, "SetDiscontinuity"), flags, 2)
        this.vtbl.GetMediaTime := CallbackCreate(GetMethod(implObj, "GetMediaTime"), flags, 3)
        this.vtbl.SetMediaTime := CallbackCreate(GetMethod(implObj, "SetMediaTime"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPointer)
        CallbackFree(this.vtbl.GetSize)
        CallbackFree(this.vtbl.GetTime)
        CallbackFree(this.vtbl.SetTime)
        CallbackFree(this.vtbl.IsSyncPoint)
        CallbackFree(this.vtbl.SetSyncPoint)
        CallbackFree(this.vtbl.IsPreroll)
        CallbackFree(this.vtbl.SetPreroll)
        CallbackFree(this.vtbl.GetActualDataLength)
        CallbackFree(this.vtbl.SetActualDataLength)
        CallbackFree(this.vtbl.GetMediaType)
        CallbackFree(this.vtbl.SetMediaType)
        CallbackFree(this.vtbl.IsDiscontinuity)
        CallbackFree(this.vtbl.SetDiscontinuity)
        CallbackFree(this.vtbl.GetMediaTime)
        CallbackFree(this.vtbl.SetMediaTime)
    }
}
