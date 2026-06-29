#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\System\Com\IBindCtx.ahk" { IBindCtx }
#Import ".\ACCOUNT_STATE.ahk" { ACCOUNT_STATE }
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDENTITY_URL.ahk" { IDENTITY_URL }
#Import "..\..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods of interaction with a connected identity provider.
 * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nn-identityprovider-iconnectedidentityprovider
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 */
export default struct IConnectedIdentityProvider extends IUnknown {
    /**
     * The interface identifier for IConnectedIdentityProvider
     * @type {Guid}
     */
    static IID := Guid("{b7417b54-e08c-429b-96c8-678d1369ecb1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IConnectedIdentityProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ConnectIdentity    : IntPtr
        DisconnectIdentity : IntPtr
        IsConnected        : IntPtr
        GetUrl             : IntPtr
        GetAccountState    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IConnectedIdentityProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Connects an identity to a domain user.
     * @remarks
     * The <i>AuthBuffer</i> parameter can be encrypted in the system context if the credential is collected on the secure desktop. In that case, the identity provider cannot decrypt the credential in the current process. To decrypt the buffer, the identity provider will need to send the credential to a process that is running in the system context.
     * @param {Pointer<Integer>} AuthBuffer A marshaled authentication buffer <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX2</a> structure that contains the credential of the online identity. The buffer can be constructed by the caller by using the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-credpackauthenticationbuffera">CredPackAuthenticationBuffer</a> function with the CRED_PACK_ID_PROVIDER_CREDENTIALS option or returned by an online identity credential provider from the <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduipromptforwindowscredentialsa">CredUIPromptForWindowsCredentials</a> function. The buffer can be optionally encrypted by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-sspiencryptauthidentityex">SspiEncryptAuthIdentityEx</a> function with the SEC_WINNT_AUTH_IDENTITY_ENCRYPT_SAME_LOGON option.
     * @param {Integer} AuthBufferSize Size, in bytes, of the <i>AuthBuffer</i> parameter.
     * @returns {HRESULT} If the method succeeds, returns S_OK.
     * 
     * If the method fails, returns a Win32 error code.
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
     * <dt><b>ERROR_LOGON_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user name or password is not correct. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_USER_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The domain user is already connected or associated with an online identity from this provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ACCOUNT_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The format of the online user name is not valid. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iconnectedidentityprovider-connectidentity
     */
    ConnectIdentity(AuthBuffer, AuthBufferSize) {
        AuthBufferMarshal := AuthBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, AuthBufferMarshal, AuthBuffer, "uint", AuthBufferSize, "HRESULT")
        return result
    }

    /**
     * Disconnects an online identity from the current domain user.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, the method returns a Win32 error code.
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
     * <dt><b>ERROR_NO_SUCH_USER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The domain user is not connected to an online identity.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iconnectedidentityprovider-disconnectidentity
     */
    DisconnectIdentity() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsConnected() {
        result := ComCall(5, this, BOOL.Ptr, &Connected := 0, "HRESULT")
        return Connected
    }

    /**
     * Returns the URL string for the specified wizard or webpage.
     * @param {IDENTITY_URL} Identifier Identifies the wizard or webpage that should be returned.
     * @param {IBindCtx} _Context Describes the context in which the URL will be displayed.
     * @param {Pointer<VARIANT>} PostData A <b>VARIANT</b> of type VT_ARRAY and VT_UI1 that will be posted to the provided URL. If the post data is not required, this parameter should be set to VT_EMPTY.
     * @param {Pointer<PWSTR>} Url Returns a URL for the specified identity wizard or webpage. The URL must begin with <b>https://</b>.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, the method returns a Win32 error code.
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iconnectedidentityprovider-geturl
     */
    GetUrl(Identifier, _Context, PostData, Url) {
        UrlMarshal := Url is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, IDENTITY_URL, Identifier, "ptr", _Context, VARIANT.Ptr, PostData, UrlMarshal, Url, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ACCOUNT_STATE} 
     */
    GetAccountState() {
        result := ComCall(7, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    Query(iid) {
        if (IConnectedIdentityProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ConnectIdentity := CallbackCreate(GetMethod(implObj, "ConnectIdentity"), flags, 3)
        this.vtbl.DisconnectIdentity := CallbackCreate(GetMethod(implObj, "DisconnectIdentity"), flags, 1)
        this.vtbl.IsConnected := CallbackCreate(GetMethod(implObj, "IsConnected"), flags, 2)
        this.vtbl.GetUrl := CallbackCreate(GetMethod(implObj, "GetUrl"), flags, 5)
        this.vtbl.GetAccountState := CallbackCreate(GetMethod(implObj, "GetAccountState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ConnectIdentity)
        CallbackFree(this.vtbl.DisconnectIdentity)
        CallbackFree(this.vtbl.IsConnected)
        CallbackFree(this.vtbl.GetUrl)
        CallbackFree(this.vtbl.GetAccountState)
    }
}
