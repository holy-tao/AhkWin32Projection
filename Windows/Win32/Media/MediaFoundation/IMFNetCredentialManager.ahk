#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFNetCredential.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by applications to provide user credentials for a network source.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfnetcredentialmanager
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFNetCredentialManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFNetCredentialManager
     * @type {Guid}
     */
    static IID => Guid("{5b87ef6b-7ed8-434f-ba0e-184fac1628d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginGetCredentials", "EndGetCredentials", "SetGood"]

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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetcredentialmanager-begingetcredentials
     */
    BeginGetCredentials(pParam, pCallback, pState) {
        result := ComCall(3, this, "ptr", pParam, "ptr", pCallback, "ptr", pState, "HRESULT")
        return result
    }

    /**
     * Completes an asynchronous request to retrieve the user's credentials.
     * @param {IMFAsyncResult} pResult Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface that contains the asynchronous result.
     * @returns {IMFNetCredential} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfnetcredential">IMFNetCredential</a> interface, which is used to retrieve the credentials. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetcredentialmanager-endgetcredentials
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetcredentialmanager-setgood
     */
    SetGood(pCred, fGood) {
        result := ComCall(5, this, "ptr", pCred, "int", fGood, "HRESULT")
        return result
    }
}
