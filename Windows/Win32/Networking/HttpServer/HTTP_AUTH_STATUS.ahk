#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the authentication state of a request.
 * @see https://docs.microsoft.com/windows/win32/api//http/ne-http-http_auth_status
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_AUTH_STATUS{

    /**
     * The request was successfully authenticated for the authentication type indicated in the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_request_auth_info">HTTP_REQUEST_AUTH_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static HttpAuthStatusSuccess => 0

    /**
     * Authentication was configured on the URL group for this request, however, the HTTP Server API did not handle the authentication. This could be because of one of the following reasons:
     * 
     * <ul>
     * <li>	The scheme defined in the <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_header_id">HttpHeaderAuthorization</a> header of the request is not supported by the HTTP Server API, or it is not enabled on the URL Group. If the scheme is not enabled, the <b>AuthType</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_request_auth_info">HTTP_REQUEST_AUTH_INFO</a> is set to the appropriate type, otherwise <b>AuthType</b> will have the value <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_request_auth_type">HttpRequestAuthTypeNone</a>. 
     * </li>
     * <li>The authorization header is not present, however, authentication is enabled on the URL Group.</li>
     * </ul>
     * The application should either proceed with its own authentication or respond with the initial 401 challenge containing the desired set of authentication schemes.
     * @type {Integer (Int32)}
     */
    static HttpAuthStatusNotAuthenticated => 1

    /**
     * Authentication for the authentication type listed in the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_request_auth_info">HTTP_REQUEST_AUTH_INFO</a>   structure failed, possibly due to one of the following reasons:<ul>
     * <li>The Security Service Provider Interface (SSPI) based authentication scheme failed to successfully return from a call to <a href="https://docs.microsoft.com/previous-versions/windows/embedded/ms937012(v=msdn.10)">AcceptSecurityContext</a>. The error returned <a href="https://docs.microsoft.com/previous-versions/windows/embedded/ms937012(v=msdn.10)">AcceptSecurityContext</a> is indicated in the <b>SecStatus</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_request_auth_info">HTTP_REQUEST_AUTH_INFO</a> structure.</li>
     * <li>The finalized client context is for a Null NTLM session. Null sessions are treated as authentication failures.</li>
     * <li>The call to  <b>LogonUser</b> failed for the Basic authentication.</li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static HttpAuthStatusFailure => 2
}
