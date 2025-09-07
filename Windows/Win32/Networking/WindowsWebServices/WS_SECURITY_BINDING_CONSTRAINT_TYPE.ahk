#Requires AutoHotkey v2.0.0 64-bit

/**
 * The values in this enumeration are used to identify the sub-types of WS_SECURITY_BINDING_CONSTRAINT.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_security_binding_constraint_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURITY_BINDING_CONSTRAINT_TYPE{

    /**
     * This value is used in the type field of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_constraint">WS_SECURITY_BINDING_CONSTRAINT</a> to identify a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_ssl_transport_security_binding_constraint">WS_SSL_TRANSPORT_SECURITY_BINDING_CONSTRAINT</a> structure.
     * @type {Integer (Int32)}
     */
    static WS_SSL_TRANSPORT_SECURITY_BINDING_CONSTRAINT_TYPE => 1

    /**
     * This value is used in the type field of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_constraint">WS_SECURITY_BINDING_CONSTRAINT</a> to identify a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_tcp_sspi_transport_security_binding_constraint">WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_CONSTRAINT</a> structure.
     * @type {Integer (Int32)}
     */
    static WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_CONSTRAINT_TYPE => 2

    /**
     * This value is used in the type field of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_constraint">WS_SECURITY_BINDING_CONSTRAINT</a> to identify a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_http_header_auth_security_binding_constraint">WS_HTTP_HEADER_AUTH_SECURITY_BINDING_CONSTRAINT</a> structure.
     * @type {Integer (Int32)}
     */
    static WS_HTTP_HEADER_AUTH_SECURITY_BINDING_CONSTRAINT_TYPE => 3

    /**
     * This value is used in the type field of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_constraint">WS_SECURITY_BINDING_CONSTRAINT</a> to identify a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_username_message_security_binding_constraint">WS_USERNAME_MESSAGE_SECURITY_BINDING_CONSTRAINT</a> structure.
     * @type {Integer (Int32)}
     */
    static WS_USERNAME_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE => 4

    /**
     * This value is used in the type field of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_constraint">WS_SECURITY_BINDING_CONSTRAINT</a> to identify a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_kerberos_apreq_message_security_binding_constraint">WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_CONSTRAINT</a> structure.
     * @type {Integer (Int32)}
     */
    static WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE => 5

    /**
     * This value is used in the type field of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_constraint">WS_SECURITY_BINDING_CONSTRAINT</a> to identify a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_issued_token_message_security_binding_constraint">WS_ISSUED_TOKEN_MESSAGE_SECURITY_BINDING_CONSTRAINT</a> structure.
     * @type {Integer (Int32)}
     */
    static WS_ISSUED_TOKEN_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE => 6

    /**
     * This value is used in the type field of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_constraint">WS_SECURITY_BINDING_CONSTRAINT</a> to identify a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_cert_message_security_binding_constraint">WS_CERT_MESSAGE_SECURITY_BINDING_CONSTRAINT</a> structure.
     * @type {Integer (Int32)}
     */
    static WS_CERT_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE => 7

    /**
     * This value is used in the type field of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_constraint">WS_SECURITY_BINDING_CONSTRAINT</a> to identify a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_security_context_message_security_binding_constraint">WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_CONSTRAINT</a> structure.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE => 8
}
