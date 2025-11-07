#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the target for the HTTP header authentication security binding.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_http_header_auth_target
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_HTTP_HEADER_AUTH_TARGET{

    /**
     * Indicates that the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_http_header_auth_security_binding">WS_HTTP_HEADER_AUTH_SECURITY_BINDING</a> containing
     * this setting authenticates to the server.
     * @type {Integer (Int32)}
     */
    static WS_HTTP_HEADER_AUTH_TARGET_SERVICE => 1

    /**
     * Indicates that the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_http_header_auth_security_binding">WS_HTTP_HEADER_AUTH_SECURITY_BINDING</a> containing
     * this setting authenticates to the proxy.
     * @type {Integer (Int32)}
     */
    static WS_HTTP_HEADER_AUTH_TARGET_PROXY => 2
}
