#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\HTTP_SERVER_AUTHENTICATION_DIGEST_PARAMS.ahk
#Include .\HTTP_SERVER_AUTHENTICATION_BASIC_PARAMS.ahk

/**
 * Used to enable server-side authentication on a URL group or server session.
 * @remarks
 * The <b>HTTP_SERVER_AUTHENTICATION_INFO</b> structure is included in the HTTP request if authentication has been configured on the associated URL group. The original HTTP authentication header received from the client is always included in the HTTP request, regardless of the authentication status.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_server_authentication_info
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVER_AUTHENTICATION_INFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_property_flags">HTTP_PROPERTY_FLAGS</a> structure that specifies if the property is present.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The supported authentication schemes. This can be one or more of the following:
     * 
     * <table>
     * <tr>
     * <th>Authentication Scheme</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_AUTH_ENABLE_BASIC"></a><a id="http_auth_enable_basic"></a><dl>
     * <dt><b>HTTP_AUTH_ENABLE_BASIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Basic authentication is enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_AUTH_ENABLE_DIGEST"></a><a id="http_auth_enable_digest"></a><dl>
     * <dt><b>HTTP_AUTH_ENABLE_DIGEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Digest authentication is enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_AUTH_ENABLE_NTLM"></a><a id="http_auth_enable_ntlm"></a><dl>
     * <dt><b>HTTP_AUTH_ENABLE_NTLM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NTLM authentication is enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="_HTTP_AUTH_ENABLE_NEGOTIATE"></a><a id="_http_auth_enable_negotiate"></a><dl>
     * <dt><b> HTTP_AUTH_ENABLE_NEGOTIATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Negotiate authentication is enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_AUTH_ENABLE_KERBEROS"></a><a id="http_auth_enable_kerberos"></a><dl>
     * <dt><b>HTTP_AUTH_ENABLE_KERBEROS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Kerberos authentication is enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="_HTTP_AUTH_ENABLE_ALL"></a><a id="_http_auth_enable_all"></a><dl>
     * <dt><b> HTTP_AUTH_ENABLE_ALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All types of authentication are enabled.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    AuthSchemes {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A Boolean value that indicates, if <b>True</b>, that the client application receives the server credentials for mutual authentication with the authenticated request. If <b>False</b>, the client application does not receive the credentials.
     * 
     * Be aware that this option is set for all  requests served by the associated request queue.
     * @type {Integer}
     */
    ReceiveMutualAuth {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * A Boolean value that indicates, if <b>True</b>, that the finalized client context is serialized and passed to the application with the request. If <b>False</b>, the application does not receive the context. This handle can be used to query context attributes.
     * @type {Integer}
     */
    ReceiveContextHandle {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * A Boolean value that indicates, if <b>True</b>, that the NTLM credentials are not cached. If <b>False</b>, the default behavior is preserved.
     * 
     * By default,  HTTP caches the client context for Keep Alive (KA) connections for the NTLM scheme if the request did not originate from a proxy.
     * @type {Integer}
     */
    DisableNTLMCredentialCaching {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * Optional authentication flags. Can be one or more of the following possible values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_AUTH_EX_FLAG_ENABLE_KERBEROS_CREDENTIAL_CACHING"></a><a id="http_auth_ex_flag_enable_kerberos_credential_caching"></a><dl>
     * <dt><b>HTTP_AUTH_EX_FLAG_ENABLE_KERBEROS_CREDENTIAL_CACHING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, the Kerberos authentication credentials are cached. Kerberos or Negotiate authentication must be enabled by <b>AuthSchemes</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_AUTH_EX_FLAG_CAPTURE_CREDENTIAL"></a><a id="http_auth_ex_flag_capture_credential"></a><dl>
     * <dt><b>HTTP_AUTH_EX_FLAG_CAPTURE_CREDENTIAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  If set, the HTTP Server API captures the caller's credentials and uses them for Kerberos or Negotiate authentication. Kerberos or Negotiate authentication must be enabled by <b>AuthSchemes</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ExFlags {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_server_authentication_digest_params">HTTP_SERVER_AUTHENTICATION_DIGEST_PARAMS</a> structure that provides the domain and realm for the digest challenge.
     * @type {HTTP_SERVER_AUTHENTICATION_DIGEST_PARAMS}
     */
    DigestParams{
        get {
            if(!this.HasProp("__DigestParams"))
                this.__DigestParams := HTTP_SERVER_AUTHENTICATION_DIGEST_PARAMS(this.ptr + 16)
            return this.__DigestParams
        }
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_server_authentication_basic_params">HTTP_SERVER_AUTHENTICATION_BASIC_PARAMS</a> structure that provides the realm for the basic challenge.
     * @type {HTTP_SERVER_AUTHENTICATION_BASIC_PARAMS}
     */
    BasicParams{
        get {
            if(!this.HasProp("__BasicParams"))
                this.__BasicParams := HTTP_SERVER_AUTHENTICATION_BASIC_PARAMS(this.ptr + 48)
            return this.__BasicParams
        }
    }
}
