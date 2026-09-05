#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The values in this enumeration are used to identify the sub-types of WS_SECURITY_BINDING_CONSTRAINT.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_security_binding_constraint_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_SECURITY_BINDING_CONSTRAINT_TYPE extends Win32Enum {

    /**
     * This value is used in the type field of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_constraint">WS_SECURITY_BINDING_CONSTRAINT</a> to identify a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_ssl_transport_security_binding_constraint">WS_SSL_TRANSPORT_SECURITY_BINDING_CONSTRAINT</a> structure.
     * Native name: WS_SSL_TRANSPORT_SECURITY_BINDING_CONSTRAINT_TYPE
     * @type {Integer (Int32)}
     */
    static SSL_TRANSPORT_SECURITY_BINDING_CONSTRAINT_TYPE => 1

    /**
     * This value is used in the type field of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_constraint">WS_SECURITY_BINDING_CONSTRAINT</a> to identify a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_tcp_sspi_transport_security_binding_constraint">WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_CONSTRAINT</a> structure.
     * Native name: WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_CONSTRAINT_TYPE
     * @type {Integer (Int32)}
     */
    static TCP_SSPI_TRANSPORT_SECURITY_BINDING_CONSTRAINT_TYPE => 2

    /**
     * This value is used in the type field of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_constraint">WS_SECURITY_BINDING_CONSTRAINT</a> to identify a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_http_header_auth_security_binding_constraint">WS_HTTP_HEADER_AUTH_SECURITY_BINDING_CONSTRAINT</a> structure.
     * Native name: WS_HTTP_HEADER_AUTH_SECURITY_BINDING_CONSTRAINT_TYPE
     * @type {Integer (Int32)}
     */
    static HTTP_HEADER_AUTH_SECURITY_BINDING_CONSTRAINT_TYPE => 3

    /**
     * This value is used in the type field of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_constraint">WS_SECURITY_BINDING_CONSTRAINT</a> to identify a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_username_message_security_binding_constraint">WS_USERNAME_MESSAGE_SECURITY_BINDING_CONSTRAINT</a> structure.
     * Native name: WS_USERNAME_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE
     * @type {Integer (Int32)}
     */
    static USERNAME_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE => 4

    /**
     * This value is used in the type field of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_constraint">WS_SECURITY_BINDING_CONSTRAINT</a> to identify a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_kerberos_apreq_message_security_binding_constraint">WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_CONSTRAINT</a> structure.
     * Native name: WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE
     * @type {Integer (Int32)}
     */
    static KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE => 5

    /**
     * This value is used in the type field of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_constraint">WS_SECURITY_BINDING_CONSTRAINT</a> to identify a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_issued_token_message_security_binding_constraint">WS_ISSUED_TOKEN_MESSAGE_SECURITY_BINDING_CONSTRAINT</a> structure.
     * Native name: WS_ISSUED_TOKEN_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE
     * @type {Integer (Int32)}
     */
    static ISSUED_TOKEN_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE => 6

    /**
     * This value is used in the type field of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_constraint">WS_SECURITY_BINDING_CONSTRAINT</a> to identify a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_cert_message_security_binding_constraint">WS_CERT_MESSAGE_SECURITY_BINDING_CONSTRAINT</a> structure.
     * Native name: WS_CERT_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE
     * @type {Integer (Int32)}
     */
    static CERT_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE => 7

    /**
     * This value is used in the type field of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_constraint">WS_SECURITY_BINDING_CONSTRAINT</a> to identify a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_security_context_message_security_binding_constraint">WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_CONSTRAINT</a> structure.
     * Native name: WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE
     * @type {Integer (Int32)}
     */
    static CONTEXT_MESSAGE_SECURITY_BINDING_CONSTRAINT_TYPE => 8
}
