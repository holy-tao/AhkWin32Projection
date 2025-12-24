#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Gets credentials from the credential cache.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfnetcredentialcache
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFNetCredentialCache extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFNetCredentialCache
     * @type {Guid}
     */
    static IID => Guid("{5b87ef6c-7ed8-434f-ba0e-184fac1628d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCredential", "SetGood", "SetUserOptions"]

    /**
     * Retrieves the credential object for the specified URL.
     * @param {PWSTR} pszUrl A null-terminated wide-character string containing the URL for which the credential is needed.
     * @param {PWSTR} pszRealm A null-terminated wide-character string containing the realm for the authentication.
     * @param {Integer} dwAuthenticationFlags Bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfnetauthenticationflags">MFNetAuthenticationFlags</a> enumeration.
     * @param {Pointer<IMFNetCredential>} ppCred Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfnetcredential">IMFNetCredential</a> interface. The caller must release the interface.
     * @param {Pointer<Integer>} pdwRequirementsFlags Receives a bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfnetcredentialrequirements">MFNetCredentialRequirements</a> enumeration.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetcredentialcache-getcredential
     */
    GetCredential(pszUrl, pszRealm, dwAuthenticationFlags, ppCred, pdwRequirementsFlags) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl
        pszRealm := pszRealm is String ? StrPtr(pszRealm) : pszRealm

        pdwRequirementsFlagsMarshal := pdwRequirementsFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pszUrl, "ptr", pszRealm, "uint", dwAuthenticationFlags, "ptr*", ppCred, pdwRequirementsFlagsMarshal, pdwRequirementsFlags, "HRESULT")
        return result
    }

    /**
     * Reports whether the credential object provided successfully passed the authentication challenge.
     * @param {IMFNetCredential} pCred Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfnetcredential">IMFNetCredential</a> interface.
     * @param {BOOL} fGood <b>TRUE</b> if the credential object succeeded in the authentication challenge; otherwise, <b>FALSE</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetcredentialcache-setgood
     */
    SetGood(pCred, fGood) {
        result := ComCall(4, this, "ptr", pCred, "int", fGood, "HRESULT")
        return result
    }

    /**
     * Specifies how user credentials are stored.
     * @param {IMFNetCredential} pCred Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfnetcredential">IMFNetCredential</a> interface. Obtain this pointer by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfnetcredentialcache-getcredential">IMFNetCredentialCache::GetCredential</a>.
     * @param {Integer} dwOptionsFlags Bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfnetcredentialoptions">MFNetCredentialOptions</a> enumeration.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfnetcredentialcache-setuseroptions
     */
    SetUserOptions(pCred, dwOptionsFlags) {
        result := ComCall(5, this, "ptr", pCred, "uint", dwOptionsFlags, "HRESULT")
        return result
    }
}
