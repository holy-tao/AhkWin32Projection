#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\MFBYTESTREAM_BUFFERING_PARAMS.ahk" { MFBYTESTREAM_BUFFERING_PARAMS }

/**
 * Controls how a byte stream buffers data from a network.
 * @remarks
 * If a byte stream implements this interface, a media source can use it to control how the byte stream buffers data. This interface is designed for byte streams that read data from a network.
 *       
 * 
 * A byte stream that implements this interface should also implement the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaeventgenerator">IMFMediaEventGenerator</a> interface. When the byte stream starts buffering, it sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/mebufferingstarted">MEBufferingStarted</a> event. When it stops buffering, it sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/mebufferingstopped">MEBufferingStopped</a> event.
 *       
 * 
 * The byte stream must send a matching <a href="https://docs.microsoft.com/windows/desktop/medfound/mebufferingstopped">MEBufferingStopped</a> event for every <a href="https://docs.microsoft.com/windows/desktop/medfound/mebufferingstarted">MEBufferingStarted</a> event. The byte stream must not send MEBufferingStarted events unless the media source has enabled buffering by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfbytestreambuffering-enablebuffering">EnableBuffering</a> with the value <b>TRUE</b>.
 *       
 * 
 * After the byte stream sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/mebufferingstarted">MEBufferingStarted</a> event, it should send <a href="https://docs.microsoft.com/windows/desktop/medfound/mebufferingstopped">MEBufferingStopped</a> if any of the following occur:
 *       
 * 
 * <ul>
 * <li>The byte stream finishes buffering data.
 *           </li>
 * <li>The byte stream reaches the end of the stream.
 *           </li>
 * <li>The media source calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfbytestreambuffering-enablebuffering">EnableBuffering</a> with the value <b>FALSE</b>.
 *           </li>
 * <li>The media source calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfbytestreambuffering-stopbuffering">StopBuffering</a>.
 *           </li>
 * </ul>
 * The byte stream should not send any more buffering events after it reaches the end of the file.
 *       
 * 
 * If buffering is disabled, the byte stream does not send any buffering events. Internally, however, it might still buffer data while it waits for I/O requests to complete. Therefore, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> methods might take an indefinite length of time to complete.
 *       
 * 
 * If the byte stream is buffering data internally and the media source calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfbytestreambuffering-enablebuffering">EnableBuffering</a> with the value <b>TRUE</b>, the byte stream can send <a href="https://docs.microsoft.com/windows/desktop/medfound/mebufferingstarted">MEBufferingStarted</a> immediately.
 *       
 * 
 * After the presentation has started, the media source should forward and <a href="https://docs.microsoft.com/windows/desktop/medfound/mebufferingstarted">MEBufferingStarted</a> and <a href="https://docs.microsoft.com/windows/desktop/medfound/mebufferingstopped">MEBufferingStopped</a> events that it receives while started. The Media Session will pause the presentation clock while buffering is progress and restart the presentation clock when buffering completes. The media source should only forward these events while the presentation is playing. The purpose of sending these events to the Media Session is to pause the presentation time while the source buffers data.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfbytestreambuffering
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFByteStreamBuffering extends IUnknown {
    /**
     * The interface identifier for IMFByteStreamBuffering
     * @type {Guid}
     */
    static IID := Guid("{6d66d782-1d4f-4db7-8c63-cb8c77f1ef5e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFByteStreamBuffering interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetBufferingParams : IntPtr
        EnableBuffering    : IntPtr
        StopBuffering      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFByteStreamBuffering.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the buffering parameters.
     * @param {Pointer<MFBYTESTREAM_BUFFERING_PARAMS>} pParams Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ns-mfidl-mfbytestream_buffering_params">MFBYTESTREAM_BUFFERING_PARAMS</a> structure that contains the buffering parameters. The byte stream uses this information to calculate how much data to buffer from the network.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfbytestreambuffering-setbufferingparams
     */
    SetBufferingParams(pParams) {
        result := ComCall(3, this, MFBYTESTREAM_BUFFERING_PARAMS.Ptr, pParams, "HRESULT")
        return result
    }

    /**
     * Enables or disables buffering.
     * @remarks
     * Before calling this method, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfbytestreambuffering-setbufferingparams">IMFByteStreamBuffering::SetBufferingParams</a> to set the buffering parameters on the byte stream.
     * @param {BOOL} fEnable Specifies whether the byte stream buffers data. If <b>TRUE</b>, buffering is enabled. If <b>FALSE</b>, buffering is disabled.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfbytestreambuffering-enablebuffering
     */
    EnableBuffering(fEnable) {
        result := ComCall(4, this, BOOL, fEnable, "HRESULT")
        return result
    }

    /**
     * Stops any buffering that is in progress.
     * @remarks
     * If the byte stream is currently buffering data, it stops and sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/mebufferingstopped">MEBufferingStopped</a> event. If the byte stream is not currently buffering, this method has no effect.
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
     * The byte stream successfully stopped buffering.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No buffering was in progress.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfbytestreambuffering-stopbuffering
     */
    StopBuffering() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFByteStreamBuffering.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetBufferingParams := CallbackCreate(GetMethod(implObj, "SetBufferingParams"), flags, 2)
        this.vtbl.EnableBuffering := CallbackCreate(GetMethod(implObj, "EnableBuffering"), flags, 2)
        this.vtbl.StopBuffering := CallbackCreate(GetMethod(implObj, "StopBuffering"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetBufferingParams)
        CallbackFree(this.vtbl.EnableBuffering)
        CallbackFree(this.vtbl.StopBuffering)
    }
}
