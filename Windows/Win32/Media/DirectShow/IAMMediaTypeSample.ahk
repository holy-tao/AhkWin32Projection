#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IStreamSample.ahk

/**
 * Note  This interface is deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//amstream/nn-amstream-iammediatypesample
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMMediaTypeSample extends IStreamSample{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMMediaTypeSample
     * @type {Guid}
     */
    static IID => Guid("{ab6b4afb-f6e4-11d0-900d-00c04fd9189d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPointer", "GetPointer", "GetSize", "GetTime", "SetTime", "IsSyncPoint", "SetSyncPoint", "IsPreroll", "SetPreroll", "GetActualDataLength", "SetActualDataLength", "GetMediaType", "SetMediaType", "IsDiscontinuity", "SetDiscontinuity", "GetMediaTime", "SetMediaTime"]

    /**
     * Note  This interface is deprecated. New applications should not use it. The SetPointer method sets the pointer to the media sample's memory buffer.
     * @param {Pointer<Integer>} pBuffer Pointer to a memory buffer allocated by the caller, or <b>NULL</b>.
     * @param {Integer} lSize Size of the buffer, in bytes.
     * @returns {HRESULT} Returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediatypesample-setpointer
     */
    SetPointer(pBuffer, lSize) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, pBufferMarshal, pBuffer, "int", lSize, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetPointer method retrieves a read/write pointer to the buffer's memory.
     * @returns {Pointer<Integer>} Address of a pointer to the buffer.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediatypesample-getpointer
     */
    GetPointer() {
        result := ComCall(9, this, "ptr*", &ppBuffer := 0, "HRESULT")
        return ppBuffer
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetSize method retrieves the size of the buffer data area, in bytes.
     * @returns {Integer} Returns the size of the buffer data area, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediatypesample-getsize
     */
    GetSize() {
        result := ComCall(10, this, "int")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetTime method retrieves the stream times at which the sample should start and stop.
     * @param {Pointer<Integer>} pTimeStart Pointer to a variable that receives the start time.
     * @param {Pointer<Integer>} pTimeEnd Pointer to a variable that receives the stop time. If the sample has no stop time, the value is set to the start time plus one.
     * @returns {HRESULT} Returns one of the following values.
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
     * <dt><b>VFW_E_SAMPLE_TIME_NOT_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sample does not have any time stamps.
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
     * The sample has a valid start time but no stop time.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediatypesample-gettime
     */
    GetTime(pTimeStart, pTimeEnd) {
        pTimeStartMarshal := pTimeStart is VarRef ? "int64*" : "ptr"
        pTimeEndMarshal := pTimeEnd is VarRef ? "int64*" : "ptr"

        result := ComCall(11, this, pTimeStartMarshal, pTimeStart, pTimeEndMarshal, pTimeEnd, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The SetTime method sets the stream times at which the sample should start and stop.
     * @param {Pointer<Integer>} pTimeStart Pointer to a variable that contains the start time.
     * @param {Pointer<Integer>} pTimeEnd Pointer to a variable that contains the stop time.
     * @returns {HRESULT} Returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediatypesample-settime
     */
    SetTime(pTimeStart, pTimeEnd) {
        pTimeStartMarshal := pTimeStart is VarRef ? "int64*" : "ptr"
        pTimeEndMarshal := pTimeEnd is VarRef ? "int64*" : "ptr"

        result := ComCall(12, this, pTimeStartMarshal, pTimeStart, pTimeEndMarshal, pTimeEnd, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The IsSyncPoint method determines if the beginning of a sample is a synchronization point.
     * @returns {HRESULT} Returns S_OK if the beginning of the sample is a synchronization point, or S_FALSE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediatypesample-issyncpoint
     */
    IsSyncPoint() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The SetSyncPoint method specifies whether the beginning of this sample is a synchronization point.
     * @param {BOOL} bIsSyncPoint Boolean value that specifies whether the beginning of this sample is a synchronization point. If <b>TRUE</b>, the beginning of the sample is a synchronization point.
     * @returns {HRESULT} Returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediatypesample-setsyncpoint
     */
    SetSyncPoint(bIsSyncPoint) {
        result := ComCall(14, this, "int", bIsSyncPoint, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The IsPreroll method determines if this sample is part of the preroll. A preroll sample should not be displayed.
     * @returns {HRESULT} Returns S_OK if the sample is a preroll sample, or S_FALSE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediatypesample-ispreroll
     */
    IsPreroll() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The SetPreroll method specifies whether this is a preroll sample. A preroll sample should not be displayed.
     * @param {BOOL} bIsPreroll Boolean value that specifies whether the sample is a preroll sample. If <b>TRUE</b>, it is for preroll and should not be displayed.
     * @returns {HRESULT} Returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediatypesample-setpreroll
     */
    SetPreroll(bIsPreroll) {
        result := ComCall(16, this, "int", bIsPreroll, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetActualDataLength method retrieves the data length of the sample, in bytes.
     * @returns {Integer} Returns the data length of the sample, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediatypesample-getactualdatalength
     */
    GetActualDataLength() {
        result := ComCall(17, this, "int")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The SetActualDataLength method sets the sample's data length.
     * @param {Integer} __MIDL__IAMMediaTypeSample0000 Length of the data in the media sample, in bytes.
     * @returns {HRESULT} Returns one of the following values.
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
     * <dt><b>VFW_E_BUFFER_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is not big enough.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediatypesample-setactualdatalength
     */
    SetActualDataLength(__MIDL__IAMMediaTypeSample0000) {
        result := ComCall(18, this, "int", __MIDL__IAMMediaTypeSample0000, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetMediaType method retrieves the media type of the sample. If the format has not changed from the previous sample, the sample might not carry a media type.
     * @returns {Pointer<AM_MEDIA_TYPE>} Address of a pointer that receives an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediatypesample-getmediatype
     */
    GetMediaType() {
        result := ComCall(19, this, "ptr*", &ppMediaType := 0, "HRESULT")
        return ppMediaType
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The SetMediaType method sets the media type for the sample.
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that describes the media type.
     * @returns {HRESULT} Returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediatypesample-setmediatype
     */
    SetMediaType(pMediaType) {
        result := ComCall(20, this, "ptr", pMediaType, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The IsDiscontinuity method determines if this sample represents a discontinuity in the data stream.
     * @returns {HRESULT} Returns S_OK if this sample is a discontinuity, or S_FALSE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediatypesample-isdiscontinuity
     */
    IsDiscontinuity() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The SetDiscontinuity method sets the discontinuity property.
     * @param {BOOL} bDiscontinuity Value that specifies whether this sample is a discontinuity. If the sample is discontinuous with the previous sample, set the value to <b>TRUE</b>. Otherwise, set the value to <b>FALSE</b>.
     * @returns {HRESULT} Returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediatypesample-setdiscontinuity
     */
    SetDiscontinuity(bDiscontinuity) {
        result := ComCall(22, this, "int", bDiscontinuity, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetMediaTime method retrieves the media time stamps for the sample.
     * @param {Pointer<Integer>} pTimeStart Pointer to a variable that receives the media start time.
     * @param {Pointer<Integer>} pTimeEnd Pointer to a variable that receives the media stop time.
     * @returns {HRESULT} Returns one of the following values.
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
     * No media time stamp was set for this sample.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediatypesample-getmediatime
     */
    GetMediaTime(pTimeStart, pTimeEnd) {
        pTimeStartMarshal := pTimeStart is VarRef ? "int64*" : "ptr"
        pTimeEndMarshal := pTimeEnd is VarRef ? "int64*" : "ptr"

        result := ComCall(23, this, pTimeStartMarshal, pTimeStart, pTimeEndMarshal, pTimeEnd, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The SetMediaTime method sets the media time stamps for this sample.
     * @param {Pointer<Integer>} pTimeStart Pointer to a variable that contains the media start time.
     * @param {Pointer<Integer>} pTimeEnd Pointer to a variable that contains the media stop time.
     * @returns {HRESULT} Returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediatypesample-setmediatime
     */
    SetMediaTime(pTimeStart, pTimeEnd) {
        pTimeStartMarshal := pTimeStart is VarRef ? "int64*" : "ptr"
        pTimeEndMarshal := pTimeEnd is VarRef ? "int64*" : "ptr"

        result := ComCall(24, this, pTimeStartMarshal, pTimeStart, pTimeEndMarshal, pTimeEnd, "HRESULT")
        return result
    }
}
