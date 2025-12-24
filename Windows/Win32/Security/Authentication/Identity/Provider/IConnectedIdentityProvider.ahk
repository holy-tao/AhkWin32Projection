#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\System\Com\IUnknown.ahk

/**
 * Provides methods of interaction with a connected identity provider.
 * @see https://docs.microsoft.com/windows/win32/api//identityprovider/nn-identityprovider-iconnectedidentityprovider
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 * @version v4.0.30319
 */
class IConnectedIdentityProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConnectedIdentityProvider
     * @type {Guid}
     */
    static IID => Guid("{b7417b54-e08c-429b-96c8-678d1369ecb1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConnectIdentity", "DisconnectIdentity", "IsConnected", "GetUrl", "GetAccountState"]

    /**
     * Connects an identity to a domain user.
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
     * @see https://docs.microsoft.com/windows/win32/api//identityprovider/nf-identityprovider-iconnectedidentityprovider-connectidentity
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
     * @see https://docs.microsoft.com/windows/win32/api//identityprovider/nf-identityprovider-iconnectedidentityprovider-disconnectidentity
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
        result := ComCall(5, this, "int*", &Connected := 0, "HRESULT")
        return Connected
    }

    /**
     * Returns the URL string for the specified wizard or webpage.
     * @param {Integer} Identifier Identifies the wizard or webpage that should be returned.
     * @param {IBindCtx} Context Describes the context in which the URL will be displayed.
     * @param {Pointer<VARIANT>} PostData A <b>VARIANT</b> of type VT_ARRAY and VT_UI1 that will be posted to the provided URL. If the post data is not required, this parameter should be set to VT_EMPTY.
     * @param {Pointer<PWSTR>} Url Returns a URL for the specified identity wizard or webpage. The URL must begin with <b>https://</b>.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, the method returns a Win32 error code.
     * @see https://docs.microsoft.com/windows/win32/api//identityprovider/nf-identityprovider-iconnectedidentityprovider-geturl
     */
    GetUrl(Identifier, Context, PostData, Url) {
        UrlMarshal := Url is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "int", Identifier, "ptr", Context, "ptr", PostData, UrlMarshal, Url, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetAccountState() {
        result := ComCall(7, this, "int*", &pState := 0, "HRESULT")
        return pState
    }
}
