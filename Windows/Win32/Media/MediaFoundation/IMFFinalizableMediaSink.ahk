#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFAsyncCallback.ahk" { IMFAsyncCallback }
#Import ".\IMFMediaSink.ahk" { IMFMediaSink }
#Import ".\IMFAsyncResult.ahk" { IMFAsyncResult }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Optionally supported by media sinks to perform required tasks before shutdown.
 * @remarks
 * If a media sink exposes this interface, the Media Session will call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imffinalizablemediasink-beginfinalize">BeginFinalize</a> on the sink before the session closes.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imffinalizablemediasink
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFFinalizableMediaSink extends IMFMediaSink {
    /**
     * The interface identifier for IMFFinalizableMediaSink
     * @type {Guid}
     */
    static IID := Guid("{eaecb74a-9a50-42ce-9541-6a7f57aa4ad7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFFinalizableMediaSink interfaces
    */
    struct Vtbl extends IMFMediaSink.Vtbl {
        BeginFinalize : IntPtr
        EndFinalize   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFFinalizableMediaSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies the media sink to asynchronously take any steps it needs to finish its tasks.
     * @remarks
     * Many archive media sinks have steps they need to do at the end of archiving to complete their file operations, such as updating the header (for some formats) or flushing all pending writes to disk. In some cases, this may include expensive operations such as indexing the content. <b>BeginFinalize</b> is an asynchronous way to initiate final tasks.
     * 
     * When the finalize operation is complete, the callback object's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method is called. At that point, the application should call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imffinalizablemediasink-endfinalize">IMFFinalizableMediaSink::EndFinalize</a> to complete the asynchronous request.
     * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of an asynchronous object. The caller must implement this interface.
     * @param {IUnknown} punkState Pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imffinalizablemediasink-beginfinalize
     */
    BeginFinalize(pCallback, punkState) {
        result := ComCall(12, this, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return result
    }

    /**
     * Completes an asynchronous finalize operation.
     * @remarks
     * Call this method after the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imffinalizablemediasink-beginfinalize">IMFFinalizableMediaSink::BeginFinalize</a> method completes asynchronously.
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imffinalizablemediasink-endfinalize
     */
    EndFinalize(pResult) {
        result := ComCall(13, this, "ptr", pResult, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFFinalizableMediaSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BeginFinalize := CallbackCreate(GetMethod(implObj, "BeginFinalize"), flags, 3)
        this.vtbl.EndFinalize := CallbackCreate(GetMethod(implObj, "EndFinalize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BeginFinalize)
        CallbackFree(this.vtbl.EndFinalize)
    }
}
