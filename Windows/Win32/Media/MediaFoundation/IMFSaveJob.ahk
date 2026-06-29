#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFAsyncCallback.ahk" { IMFAsyncCallback }
#Import ".\IMFAsyncResult.ahk" { IMFAsyncResult }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFByteStream.ahk" { IMFByteStream }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Persists media data from a source byte stream to an application-provided byte stream.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfsavejob
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSaveJob extends IUnknown {
    /**
     * The interface identifier for IMFSaveJob
     * @type {Guid}
     */
    static IID := Guid("{e9931663-80bf-4c6e-98af-5dcf58747d1f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSaveJob interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        BeginSave   : IntPtr
        EndSave     : IntPtr
        CancelSave  : IntPtr
        GetProgress : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSaveJob.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Begins saving a Windows Media file to the application's byte stream.
     * @remarks
     * When the operation completes, the callback object's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method is called. At that point, the application should call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsavejob-endsave">IMFSaveJob::EndSave</a> to complete the asynchronous request.
     * @param {IMFByteStream} pStream Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of the application's byte stream. The data from the source byte stream is written to this byte stream.
     * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface
     * @param {IUnknown} pState Pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsavejob-beginsave
     */
    BeginSave(pStream, pCallback, pState) {
        result := ComCall(3, this, "ptr", pStream, "ptr", pCallback, "ptr", pState, "HRESULT")
        return result
    }

    /**
     * Completes the operation started by IMFSaveJob::BeginSave.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsavejob-endsave
     */
    EndSave(pResult) {
        result := ComCall(4, this, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * Cancels the operation started by IMFSaveJob::BeginSave.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsavejob-cancelsave
     */
    CancelSave() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the percentage of content saved to the provided byte stream.
     * @returns {Integer} Receives the percentage of completion.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsavejob-getprogress
     */
    GetProgress() {
        result := ComCall(6, this, "uint*", &pdwPercentComplete := 0, "HRESULT")
        return pdwPercentComplete
    }

    Query(iid) {
        if (IMFSaveJob.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BeginSave := CallbackCreate(GetMethod(implObj, "BeginSave"), flags, 4)
        this.vtbl.EndSave := CallbackCreate(GetMethod(implObj, "EndSave"), flags, 2)
        this.vtbl.CancelSave := CallbackCreate(GetMethod(implObj, "CancelSave"), flags, 1)
        this.vtbl.GetProgress := CallbackCreate(GetMethod(implObj, "GetProgress"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BeginSave)
        CallbackFree(this.vtbl.EndSave)
        CallbackFree(this.vtbl.CancelSave)
        CallbackFree(this.vtbl.GetProgress)
    }
}
