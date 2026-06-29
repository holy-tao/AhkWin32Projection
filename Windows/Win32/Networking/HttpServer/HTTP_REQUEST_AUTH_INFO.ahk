#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\HTTP_AUTH_STATUS.ahk" { HTTP_AUTH_STATUS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HTTP_REQUEST_AUTH_TYPE.ahk" { HTTP_REQUEST_AUTH_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains the authentication status of the request with a handle to the client token that the receiving process can use to impersonate the authenticated client.
 * @remarks
 * Starting with HTTP version 2.0, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa364545(v=vs.85)">HTTP_REQUEST</a> structure  contains an <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_request_info">HTTP_REQUEST_INFO</a> structure. The <b>pVoid</b> member of the <b>HTTP_REQUEST_INFO</b> structure points to the <b>HTTP_REQUEST_AUTH_INFO</b> when the request information type is <b>HttpRequestInfoTypeAuth</b>.
 * 
 * When the application receives a request with this structure and the request has not been authenticated, it can send the initial 401 challenge with the desired set of WWW-Authenticate headers in the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_multiple_known_headers">HTTP_MULTIPLE_KNOWN_HEADERS</a> structure. When the HTTP Server API completes  the authentication handshake, it fills  the <b>HTTP_REQUEST_AUTH_INFO</b> structure and passes it to the application with the request again. The handle to the access token that represents the client identity is provided in this structure by the HTTP Server API.
 * 
 * Context Attributes
 * 
 *  The <b>ContextAttributes</b> member is provided for SSPI based schemes. For example, SSPI applications can determine whether <b>ASC_RET_MUTUAL_AUTH</b> is set for a mutually authenticated session.
 * 
 * The HTTP Server API does not provide the expiration time for the context in the <b>PackedContext</b> member. Applications may require the expiration time  in specific  circumstances, for example, when NTLM credential caching is enabled and the application queries for the expiration time for a cached context. If the server application requires the expiration time for the underlying client context associated with the access token, it can receive the packed context and call <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesa">QueryContextAttributes</a> with the  <b>SECPKG_ATTR_LIFESPAN</b>.
 * 
 * Mutual Authentication Data
 * 
 * By default, the HTTP Server API ensures that the mutual authentication data is added to the final 200 response; in general, server applications are not responsible for sending the mutual authentication data.
 * 
 * However, applications can receive the mutual authentication data and send it with the final response. When the <b>ReceiveMutualAuth</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_server_authentication_info">HTTP_SERVER_AUTHENTICATION_INFO</a> structure is set to true, applications receive the server credentials for mutual authentication along with the authenticated request.
 * 
 * The mutual authentication data provided in the <b>pMutualAuthData</b> member contains the exact value of WWW-Authenticate header without the header name. For example, <b>pMutualAuthData</b> points to "Negotiate ade02938481eca". The application builds the WWW-Authenticate header by appending the provided <b>pMutualAuthData</b> as a response header value.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_request_auth_info
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_REQUEST_AUTH_INFO {
    #StructPack 8

    /**
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_auth_status">HTTP_AUTH_STATUS</a> enumeration that indicates the final authentication status of the request.
     * 
     * If the authentication status is not <b>HttpAuthStatusSuccess</b>, applications should disregard members of this structure except <b>AuthStatus</b>, <b>SecStatus</b>, and <b>AuthType</b>.
     */
    AuthStatus : HTTP_AUTH_STATUS

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">SECURITY_STATUS</a> value that indicates the security failure status when the <b>AuthStatus</b> member   is <b>HttpAuthStatusFailure</b>.
     */
    SecStatus : HRESULT

    /**
     * The authentication flags that indicate the following authentication attributes:
     * 
     * <table>
     * <tr>
     * <th>Attribute</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_REQUEST_AUTH_FLAG_TOKEN_FOR_CACHED_CRED"></a><a id="http_request_auth_flag_token_for_cached_cred"></a><dl>
     * <dt><b>HTTP_REQUEST_AUTH_FLAG_TOKEN_FOR_CACHED_CRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided token is for  NTLM and is based on a cached credential of a Keep Alive (KA) connection.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Flags : UInt32

    /**
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_request_auth_type">HTTP_REQUEST_AUTH_TYPE</a> enumeration that indicates the authentication scheme attempted or established  for the request.
     */
    AuthType : HTTP_REQUEST_AUTH_TYPE

    /**
     * A  handle to the client token that the receiving process can use to impersonate the authenticated client.
     * 
     * The handle to the token should be closed by calling <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> when it is no longer required. This token is valid only for the lifetime of the request. Applications can regenerate the initial 401 challenge to reauthenticate when the token expires.
     */
    AccessToken : HANDLE

    /**
     * The client context attributes for the access token.
     */
    ContextAttributes : UInt32

    /**
     * The length, in bytes, of the <b>PackedContext</b>.
     */
    PackedContextLength : UInt32

    /**
     * The type of context in the <b>PackedContext</b> member.
     */
    PackedContextType : UInt32

    /**
     * The security context for the authentication type.
     * 
     * Applications can query the attributes of the packed context by calling the SSPI <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesa">QueryContextAttributes</a> API. However, applications must acquire a  credential handle for the security package for the indicated AuthType.
     * 
     * Application should call the SSPI <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> API to free the serialized context when it is no longer required.
     */
    PackedContext : IntPtr

    /**
     * The length, in bytes, of the <b>pMutualAuthData</b> member.
     */
    MutualAuthDataLength : UInt32

    /**
     * The Base64 encoded mutual authentication data used in  the WWW-Authenticate header.
     */
    pMutualAuthData : PSTR

    PackageNameLength : UInt16

    pPackageName : PWSTR

}
