#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFNetCredential.ahk" { IMFNetCredential }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Gets credentials from the credential cache.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfnetcredentialcache
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFNetCredentialCache extends IUnknown {
    /**
     * The interface identifier for IMFNetCredentialCache
     * @type {Guid}
     */
    static IID := Guid("{5b87ef6c-7ed8-434f-ba0e-184fac1628d1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFNetCredentialCache interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCredential  : IntPtr
        SetGood        : IntPtr
        SetUserOptions : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFNetCredentialCache.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredentialcache-getcredential
     */
    GetCredential(pszUrl, pszRealm, dwAuthenticationFlags, ppCred, pdwRequirementsFlags) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl
        pszRealm := pszRealm is String ? StrPtr(pszRealm) : pszRealm

        pdwRequirementsFlagsMarshal := pdwRequirementsFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pszUrl, "ptr", pszRealm, "uint", dwAuthenticationFlags, IMFNetCredential.Ptr, ppCred, pdwRequirementsFlagsMarshal, pdwRequirementsFlags, "HRESULT")
        return result
    }

    /**
     * Reports whether the credential object provided successfully passed the authentication challenge.
     * @remarks
     * This method is called by the network source into the credential manager.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredentialcache-setgood
     */
    SetGood(pCred, fGood) {
        result := ComCall(4, this, "ptr", pCred, BOOL, fGood, "HRESULT")
        return result
    }

    /**
     * Specifies how user credentials are stored.
     * @remarks
     * If no flags are specified, the credentials are cached in memory. This method can be implemented by the credential manager and called by the network source.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetcredentialcache-setuseroptions
     */
    SetUserOptions(pCred, dwOptionsFlags) {
        result := ComCall(5, this, "ptr", pCred, "uint", dwOptionsFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFNetCredentialCache.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCredential := CallbackCreate(GetMethod(implObj, "GetCredential"), flags, 6)
        this.vtbl.SetGood := CallbackCreate(GetMethod(implObj, "SetGood"), flags, 3)
        this.vtbl.SetUserOptions := CallbackCreate(GetMethod(implObj, "SetUserOptions"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCredential)
        CallbackFree(this.vtbl.SetGood)
        CallbackFree(this.vtbl.SetUserOptions)
    }
}
