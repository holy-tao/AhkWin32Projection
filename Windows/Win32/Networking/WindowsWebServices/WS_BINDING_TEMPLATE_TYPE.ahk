#Requires AutoHotkey v2.0.0 64-bit

/**
 * An enumeration of the different security binding combinations that are supported.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_binding_template_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_BINDING_TEMPLATE_TYPE{

    /**
     * The policy specifies HTTP channel binding.
     * @type {Integer (Int32)}
     */
    static WS_HTTP_BINDING_TEMPLATE_TYPE => 0

    /**
     * The policy specifies HTTP channel binding with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_ssl_transport_security_binding">WS_SSL_TRANSPORT_SECURITY_BINDING</a>.
     * @type {Integer (Int32)}
     */
    static WS_HTTP_SSL_BINDING_TEMPLATE_TYPE => 1

    /**
     * The policy specifies HTTP channel binding with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_http_header_auth_security_binding">WS_HTTP_HEADER_AUTH_SECURITY_BINDING</a>
     * @type {Integer (Int32)}
     */
    static WS_HTTP_HEADER_AUTH_BINDING_TEMPLATE_TYPE => 2

    /**
     * The policy specifies HTTP channel binding with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_ssl_transport_security_binding">WS_SSL_TRANSPORT_SECURITY_BINDING</a> and
 *           <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_http_header_auth_security_binding">WS_HTTP_HEADER_AUTH_SECURITY_BINDING</a>.
     * @type {Integer (Int32)}
     */
    static WS_HTTP_SSL_HEADER_AUTH_BINDING_TEMPLATE_TYPE => 3

    /**
     * The policy specifies HTTP channel binding with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_ssl_transport_security_binding">WS_SSL_TRANSPORT_SECURITY_BINDING</a> 
 *           and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_username_message_security_binding">WS_USERNAME_MESSAGE_SECURITY_BINDING</a>.
     * @type {Integer (Int32)}
     */
    static WS_HTTP_SSL_USERNAME_BINDING_TEMPLATE_TYPE => 4

    /**
     * The policy specifies HTTP channel binding with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_ssl_transport_security_binding">WS_SSL_TRANSPORT_SECURITY_BINDING</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_kerberos_apreq_message_security_binding">WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING</a>.
     * @type {Integer (Int32)}
     */
    static WS_HTTP_SSL_KERBEROS_APREQ_BINDING_TEMPLATE_TYPE => 5

    /**
     * The policy specifies TCP channel binding.
     * @type {Integer (Int32)}
     */
    static WS_TCP_BINDING_TEMPLATE_TYPE => 6

    /**
     * The policy specifies TCP channel binding with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_tcp_sspi_transport_security_binding">WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING</a>.
     * @type {Integer (Int32)}
     */
    static WS_TCP_SSPI_BINDING_TEMPLATE_TYPE => 7

    /**
     * The policy specifies TCP channel binding with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_tcp_sspi_transport_security_binding">WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING</a> and
 *           <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_username_message_security_binding">WS_USERNAME_MESSAGE_SECURITY_BINDING</a>.
     * @type {Integer (Int32)}
     */
    static WS_TCP_SSPI_USERNAME_BINDING_TEMPLATE_TYPE => 8

    /**
     * The policy specifies TCP channel binding with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_tcp_sspi_transport_security_binding">WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING</a> and
 *           <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_kerberos_apreq_message_security_binding">WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING</a>.
     * @type {Integer (Int32)}
     */
    static WS_TCP_SSPI_KERBEROS_APREQ_BINDING_TEMPLATE_TYPE => 9

    /**
     * The policy specifies HTTP channel binding with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_ssl_transport_security_binding">WS_SSL_TRANSPORT_SECURITY_BINDING</a> and
 *           <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_security_context_message_security_binding">WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING</a>,  using bootstrap channel
 *           with HTTP channel binding, <b>WS_SSL_TRANSPORT_SECURITY_BINDING</b> and
 *           <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_username_message_security_binding">WS_USERNAME_MESSAGE_SECURITY_BINDING</a>.
     * @type {Integer (Int32)}
     */
    static WS_HTTP_SSL_USERNAME_SECURITY_CONTEXT_BINDING_TEMPLATE_TYPE => 10

    /**
     * The policy specifies HTTP channel binding with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_ssl_transport_security_binding">WS_SSL_TRANSPORT_SECURITY_BINDING</a> and
 *           <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_security_context_message_security_binding">WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING</a>,  using bootstrap channel
 *           with HTTP channel binding, <b>WS_SSL_TRANSPORT_SECURITY_BINDING</b> and
 *           <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_kerberos_apreq_message_security_binding">WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING</a>.
     * @type {Integer (Int32)}
     */
    static WS_HTTP_SSL_KERBEROS_APREQ_SECURITY_CONTEXT_BINDING_TEMPLATE_TYPE => 11

    /**
     * The policy specifies TCP channel binding with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_ssl_transport_security_binding">WS_SSL_TRANSPORT_SECURITY_BINDING</a> and
 *           <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_security_context_message_security_binding">WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING</a>,  using bootstrap channel
 *           with TCP channel binding, <b>WS_SSL_TRANSPORT_SECURITY_BINDING</b> and
 *           <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_username_message_security_binding">WS_USERNAME_MESSAGE_SECURITY_BINDING</a>.
     * @type {Integer (Int32)}
     */
    static WS_TCP_SSPI_USERNAME_SECURITY_CONTEXT_BINDING_TEMPLATE_TYPE => 12

    /**
     * The policy specifies TCP channel binding with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_ssl_transport_security_binding">WS_SSL_TRANSPORT_SECURITY_BINDING</a> and
 *           <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_security_context_message_security_binding">WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING</a>,  using bootstrap channel
 *           with TCP channel binding, <b>WS_SSL_TRANSPORT_SECURITY_BINDING</b> and
 *           <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_kerberos_apreq_message_security_binding">WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING</a>.
     * @type {Integer (Int32)}
     */
    static WS_TCP_SSPI_KERBEROS_APREQ_SECURITY_CONTEXT_BINDING_TEMPLATE_TYPE => 13
}
