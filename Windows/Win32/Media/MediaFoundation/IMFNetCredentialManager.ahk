#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFNetCredential.ahk" { IMFNetCredential }
#Import ".\IMFAsyncCallback.ahk" { IMFAsyncCallback }
#Import ".\MFNetCredentialManagerGetParam.ahk" { MFNetCredentialManagerGetParam }
#Import ".\IMFAsyncResult.ahk" { IMFAsyncResult }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implemented by applications to provide user credentials for a network source.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfnetcredentialmanager
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFNetCredentialManager extends IUnknown {
    /**
     * The interface identifier for IMFNetCredentialManager
     * @type {Guid}
     */
    static IID := Guid("{5b87ef6b-7ed8-434f-ba0e-184fac1628d1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFNetCredentialManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        BeginGetCredentials : IntPtr
        EndGetCredentials   : IntPtr
        SetGood             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFNetCredentialManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Begins an asynchronous request to retrieve the user's credentials.
     * @param {Pointer<MFNetCredentialManagerGetParam>} pParam Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ns-mfidl-mfnetcredentialmanagergetparam">MFNetCredentialManagerGetParam</a> structure.
     * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface.
     * @param {IUnknown} pState Pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. The object is returned to the caller when the callback is invoked.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredentialmanager-begingetcredentials
     */
    BeginGetCredentials(pParam, pCallback, pState) {
        result := ComCall(3, this, MFNetCredentialManagerGetParam.Ptr, pParam, "ptr", pCallback, "ptr", pState, "HRESULT")
        return result
    }

    /**
     * Completes an asynchronous request to retrieve the user's credentials.
     * @param {IMFAsyncResult} pResult Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface that contains the asynchronous result.
     * @returns {IMFNetCredential} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfnetcredential">IMFNetCredential</a> interface, which is used to retrieve the credentials. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredentialmanager-endgetcredentials
     */
    EndGetCredentials(pResult) {
        result := ComCall(4, this, "ptr", pResult, "ptr*", &ppCred := 0, "HRESULT")
        return IMFNetCredential(ppCred)
    }

    /**
     * Specifies whether the user's credentials succeeded in the authentication challenge. The network source calls this method to informs the application whether the user's credentials were authenticated.
     * @param {IMFNetCredential} pCred Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfnetcredential">IMFNetCredential</a> interface.
     * @param {BOOL} fGood Boolean value. The value is <b>TRUE</b> if the credentials succeeded in the authentication challenge. Otherwise, the value is <b>FALSE</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredentialmanager-setgood
     */
    SetGood(pCred, fGood) {
        result := ComCall(5, this, "ptr", pCred, BOOL, fGood, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFNetCredentialManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BeginGetCredentials := CallbackCreate(GetMethod(implObj, "BeginGetCredentials"), flags, 4)
        this.vtbl.EndGetCredentials := CallbackCreate(GetMethod(implObj, "EndGetCredentials"), flags, 3)
        this.vtbl.SetGood := CallbackCreate(GetMethod(implObj, "SetGood"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BeginGetCredentials)
        CallbackFree(this.vtbl.EndGetCredentials)
        CallbackFree(this.vtbl.SetGood)
    }
}
