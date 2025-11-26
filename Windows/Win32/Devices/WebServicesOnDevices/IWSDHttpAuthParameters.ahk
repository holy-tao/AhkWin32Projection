#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use this interface to retrieve the access token or authorization scheme used during the authentication of a client.
 * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nn-wsdbase-iwsdhttpauthparameters
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDHttpAuthParameters extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDHttpAuthParameters
     * @type {Guid}
     */
    static IID => Guid("{0b476df0-8dac-480d-b05c-99781a5884aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClientAccessToken", "GetAuthType"]

    /**
     * GetClientAccessToken method retrieves the client access token that can be used to either authenticate or impersonate the client.
     * @returns {HANDLE} Pointer to a variable that on return receives the token handle.
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdhttpauthparameters-getclientaccesstoken
     */
    GetClientAccessToken() {
        phToken := HANDLE()
        result := ComCall(3, this, "ptr", phToken, "HRESULT")
        return phToken
    }

    /**
     * GetAuthType method retrieves the HTTP authentication scheme used during the authentication of the client.
     * @returns {Integer} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_request_auth_type">HTTP_REQUEST_AUTH_TYPE</a>  value that indicates the HTTP authentication scheme used during authentication. Possible values include:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WSD_SECURITY_HTTP_AUTH_SCHEME_NEGOTIATE_"></a><a id="wsd_security_http_auth_scheme_negotiate_"></a><dl>
     * <dt><b>WSD_SECURITY_HTTP_AUTH_SCHEME_NEGOTIATE </b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Negotiate authentication.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WSD_SECURITY_HTTP_AUTH_SCHEME_NTLM"></a><a id="wsd_security_http_auth_scheme_ntlm"></a><dl>
     * <dt><b>WSD_SECURITY_HTTP_AUTH_SCHEME_NTLM</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NTLM authentication.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdhttpauthparameters-getauthtype
     */
    GetAuthType() {
        result := ComCall(4, this, "uint*", &pAuthType := 0, "HRESULT")
        return pAuthType
    }
}
