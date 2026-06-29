#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFMediaBuffer.ahk" { IMFMediaBuffer }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFAttributes.ahk" { IMFAttributes }

/**
 * Represents a media sample, which is a container object for media data.
 * @remarks
 * To create a new media sample, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatesample">MFCreateSample</a>.
 * 
 * <div class="alert"><b>Note</b>  <p class="note">When you call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-copyallitems">CopyAllItems</a>, inherited from the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface, on an <b>IMFSample</b>, the sample time, duration, and flags are not copied to the destination sample. You must copy these values to the new sample manually.
 * 
 * </div>
 * <div> </div>
 * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nn-mfobjects-imfsample
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSample extends IMFAttributes {
    /**
     * The interface identifier for IMFSample
     * @type {Guid}
     */
    static IID := Guid("{c40a00f2-b93a-4d80-ae8c-5a1c634f58e4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSample interfaces
    */
    struct Vtbl extends IMFAttributes.Vtbl {
        GetSampleFlags            : IntPtr
        SetSampleFlags            : IntPtr
        GetSampleTime             : IntPtr
        SetSampleTime             : IntPtr
        GetSampleDuration         : IntPtr
        SetSampleDuration         : IntPtr
        GetBufferCount            : IntPtr
        GetBufferByIndex          : IntPtr
        ConvertToContiguousBuffer : IntPtr
        AddBuffer                 : IntPtr
        RemoveBufferByIndex       : IntPtr
        RemoveAllBuffers          : IntPtr
        GetTotalLength            : IntPtr
        CopyToBuffer              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSample.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves flags associated with the sample.Currently no flags are defined.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {Integer} Receives the value zero.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-getsampleflags
     */
    GetSampleFlags() {
        result := ComCall(33, this, "uint*", &pdwSampleFlags := 0, "HRESULT")
        return pdwSampleFlags
    }

    /**
     * Sets flags associated with the sample.Currently no flags are defined.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Integer} dwSampleFlags Reserved; must be zero.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-setsampleflags
     */
    SetSampleFlags(dwSampleFlags) {
        result := ComCall(34, this, "uint", dwSampleFlags, "HRESULT")
        return result
    }

    /**
     * Retrieves the presentation time of the sample.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {Integer} Receives the presentation time, in 100-nanosecond units.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-getsampletime
     */
    GetSampleTime() {
        result := ComCall(35, this, "int64*", &phnsSampleTime := 0, "HRESULT")
        return phnsSampleTime
    }

    /**
     * Sets the presentation time of the sample.
     * @remarks
     * Some pipeline components require samples that have time stamps. Generally the component that generates the data for the sample also sets the time stamp. The Media Session might modify the time stamps.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Integer} hnsSampleTime The presentation time, in 100-nanosecond units.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-setsampletime
     */
    SetSampleTime(hnsSampleTime) {
        result := ComCall(36, this, "int64", hnsSampleTime, "HRESULT")
        return result
    }

    /**
     * Retrieves the duration of the sample.
     * @remarks
     * If the sample contains more than one buffer, the duration includes the data from all of the buffers.
     * 
     * If the retrieved duration is zero, or if the method returns <b>MF_E_NO_SAMPLE_DURATION</b>, the duration is unknown. In that case, it might be possible to calculate the duration from the media type—for example, by using the video frame rate or the audio sampling rate.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {Integer} Receives the duration, in 100-nanosecond units.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-getsampleduration
     */
    GetSampleDuration() {
        result := ComCall(37, this, "int64*", &phnsSampleDuration := 0, "HRESULT")
        return phnsSampleDuration
    }

    /**
     * Sets the duration of the sample.
     * @remarks
     * This method succeeds if the duration is negative, although negative durations are probably not valid for most types of data. It is the responsibility of the object that consumes the sample to validate the duration.
     * 
     * The duration can also be zero. This might be valid for some types of data. For example, the sample might contain stream metadata with no buffers.
     * 
     * Until this method is called, the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfsample-getsampleduration">IMFSample::GetSampleDuration</a> method returns <b>MF_E_NO_SAMPLE_DURATION</b>.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Integer} hnsSampleDuration Duration of the sample, in 100-nanosecond units.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-setsampleduration
     */
    SetSampleDuration(hnsSampleDuration) {
        result := ComCall(38, this, "int64", hnsSampleDuration, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of buffers in the sample.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {Integer} Receives the number of buffers in the sample. A sample might contain zero buffers.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-getbuffercount
     */
    GetBufferCount() {
        result := ComCall(39, this, "uint*", &pdwBufferCount := 0, "HRESULT")
        return pdwBufferCount
    }

    /**
     * Gets a buffer from the sample, by index.
     * @remarks
     * A sample might contain more than one buffer. Use the <b>GetBufferByIndex</b> method to enumerate the individual buffers.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Integer} dwIndex Index of the buffer. To find the number of buffers in the sample, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfsample-getbuffercount">IMFSample::GetBufferCount</a>. Buffers are indexed from zero.
     * @returns {IMFMediaBuffer} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-getbufferbyindex
     */
    GetBufferByIndex(dwIndex) {
        result := ComCall(40, this, "uint", dwIndex, "ptr*", &ppBuffer := 0, "HRESULT")
        return IMFMediaBuffer(ppBuffer)
    }

    /**
     * Converts a sample with multiple buffers into a sample with a single buffer.
     * @remarks
     * If the sample contains more than one buffer, this method copies the data from the original buffers into a new buffer, and replaces the original buffer list with the new buffer. The new buffer is returned in the <i>ppBuffer</i> parameter.
     * 
     * If the sample contains a single buffer, this method returns a pointer to the original buffer. In typical use, most samples do not contain multiple buffers.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {IMFMediaBuffer} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-converttocontiguousbuffer
     */
    ConvertToContiguousBuffer() {
        result := ComCall(41, this, "ptr*", &ppBuffer := 0, "HRESULT")
        return IMFMediaBuffer(ppBuffer)
    }

    /**
     * Adds a buffer to the end of the list of buffers in the sample.
     * @remarks
     * For uncompressed video data, each buffer should contain a single video frame, and samples should not contain multiple frames. In general, storing multiple buffers in a sample is discouraged.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {IMFMediaBuffer} pBuffer Pointer to the buffer's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NULL pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-addbuffer
     */
    AddBuffer(pBuffer) {
        result := ComCall(42, this, "ptr", pBuffer, "HRESULT")
        return result
    }

    /**
     * Removes a buffer at a specified index from the sample.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Integer} dwIndex Index of the buffer. To find the number of buffers in the sample, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfsample-getbuffercount">IMFSample::GetBufferCount</a>. Buffers are indexed from zero.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-removebufferbyindex
     */
    RemoveBufferByIndex(dwIndex) {
        result := ComCall(43, this, "uint", dwIndex, "HRESULT")
        return result
    }

    /**
     * Removes all of the buffers from the sample.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-removeallbuffers
     */
    RemoveAllBuffers() {
        result := ComCall(44, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the total length of the valid data in all of the buffers in the sample. The length is calculated as the sum of the values retrieved by the IMFMediaBuffer::GetCurrentLength method.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {Integer} Receives the total length of the valid data, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-gettotallength
     */
    GetTotalLength() {
        result := ComCall(45, this, "uint*", &pcbTotalLength := 0, "HRESULT")
        return pcbTotalLength
    }

    /**
     * Copies the sample data to a buffer. This method concatenates the valid data from all of the buffers of the sample, in order.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {IMFMediaBuffer} pBuffer Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface of the destination buffer. The buffer must be large enough to hold the valid data in the sample. To get the size of the data in the sample, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfsample-gettotallength">IMFSample::GetTotalLength</a>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NULL pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is not large enough to contain the data.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsample-copytobuffer
     */
    CopyToBuffer(pBuffer) {
        result := ComCall(46, this, "ptr", pBuffer, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFSample.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSampleFlags := CallbackCreate(GetMethod(implObj, "GetSampleFlags"), flags, 2)
        this.vtbl.SetSampleFlags := CallbackCreate(GetMethod(implObj, "SetSampleFlags"), flags, 2)
        this.vtbl.GetSampleTime := CallbackCreate(GetMethod(implObj, "GetSampleTime"), flags, 2)
        this.vtbl.SetSampleTime := CallbackCreate(GetMethod(implObj, "SetSampleTime"), flags, 2)
        this.vtbl.GetSampleDuration := CallbackCreate(GetMethod(implObj, "GetSampleDuration"), flags, 2)
        this.vtbl.SetSampleDuration := CallbackCreate(GetMethod(implObj, "SetSampleDuration"), flags, 2)
        this.vtbl.GetBufferCount := CallbackCreate(GetMethod(implObj, "GetBufferCount"), flags, 2)
        this.vtbl.GetBufferByIndex := CallbackCreate(GetMethod(implObj, "GetBufferByIndex"), flags, 3)
        this.vtbl.ConvertToContiguousBuffer := CallbackCreate(GetMethod(implObj, "ConvertToContiguousBuffer"), flags, 2)
        this.vtbl.AddBuffer := CallbackCreate(GetMethod(implObj, "AddBuffer"), flags, 2)
        this.vtbl.RemoveBufferByIndex := CallbackCreate(GetMethod(implObj, "RemoveBufferByIndex"), flags, 2)
        this.vtbl.RemoveAllBuffers := CallbackCreate(GetMethod(implObj, "RemoveAllBuffers"), flags, 1)
        this.vtbl.GetTotalLength := CallbackCreate(GetMethod(implObj, "GetTotalLength"), flags, 2)
        this.vtbl.CopyToBuffer := CallbackCreate(GetMethod(implObj, "CopyToBuffer"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSampleFlags)
        CallbackFree(this.vtbl.SetSampleFlags)
        CallbackFree(this.vtbl.GetSampleTime)
        CallbackFree(this.vtbl.SetSampleTime)
        CallbackFree(this.vtbl.GetSampleDuration)
        CallbackFree(this.vtbl.SetSampleDuration)
        CallbackFree(this.vtbl.GetBufferCount)
        CallbackFree(this.vtbl.GetBufferByIndex)
        CallbackFree(this.vtbl.ConvertToContiguousBuffer)
        CallbackFree(this.vtbl.AddBuffer)
        CallbackFree(this.vtbl.RemoveBufferByIndex)
        CallbackFree(this.vtbl.RemoveAllBuffers)
        CallbackFree(this.vtbl.GetTotalLength)
        CallbackFree(this.vtbl.CopyToBuffer)
    }
}
