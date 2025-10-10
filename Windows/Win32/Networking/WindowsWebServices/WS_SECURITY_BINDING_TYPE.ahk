#Requires AutoHotkey v2.0.0 64-bit

/**
 * The type of the security binding, used as a selector for subtypes of WS_SECURITY_BINDING.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_security_binding_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURITY_BINDING_TYPE{

    /**
     * Type id for the security binding <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_ssl_transport_security_binding">WS_SSL_TRANSPORT_SECURITY_BINDING</a>.
     * @type {Integer (Int32)}
     */
    static WS_SSL_TRANSPORT_SECURITY_BINDING_TYPE => 1

    /**
     * Type id for the security binding <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_tcp_sspi_transport_security_binding">WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING</a>.
     * @type {Integer (Int32)}
     */
    static WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_TYPE => 2

    /**
     * Type id for the security binding <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_http_header_auth_security_binding">WS_HTTP_HEADER_AUTH_SECURITY_BINDING</a>.
     * @type {Integer (Int32)}
     */
    static WS_HTTP_HEADER_AUTH_SECURITY_BINDING_TYPE => 3

    /**
     * Type id for the security binding <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_username_message_security_binding">WS_USERNAME_MESSAGE_SECURITY_BINDING</a>.
     * @type {Integer (Int32)}
     */
    static WS_USERNAME_MESSAGE_SECURITY_BINDING_TYPE => 4

    /**
     * Type id for the security binding <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_kerberos_apreq_message_security_binding">WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING</a>.
     * @type {Integer (Int32)}
     */
    static WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_TYPE => 5

    /**
     * Type id for the security binding <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_token_message_security_binding">WS_XML_TOKEN_MESSAGE_SECURITY_BINDING</a>.
     * @type {Integer (Int32)}
     */
    static WS_XML_TOKEN_MESSAGE_SECURITY_BINDING_TYPE => 6

    /**
     * Type id for the security binding <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_saml_message_security_binding">WS_SAML_MESSAGE_SECURITY_BINDING</a>.
     * @type {Integer (Int32)}
     */
    static WS_SAML_MESSAGE_SECURITY_BINDING_TYPE => 7

    /**
     * Type id for the security binding <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_security_context_message_security_binding">WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING</a>.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_TYPE => 8

    /**
     * Windows 8 or later:
 * Type id for the security binding <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_namedpipe_sspi_transport_security_binding">WS_NAMEDPIPE_SSPI_TRANSPORT_SECURITY_BINDING</a>.
     * @type {Integer (Int32)}
     */
    static WS_NAMEDPIPE_SSPI_TRANSPORT_SECURITY_BINDING_TYPE => 9
}
