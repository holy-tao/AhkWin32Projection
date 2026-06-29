#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SECURITY_PROPERTY_ID.ahk" { WS_SECURITY_PROPERTY_ID }
#Import ".\WS_SECURITY_PROPERTY.ahk" { WS_SECURITY_PROPERTY }

/**
 * This structure is used to specify a set of constraints for a particular security property. Any property constraints that are not specified will use the default constraints.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_property_constraint
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SECURITY_PROPERTY_CONSTRAINT {
    #StructPack 8


    struct _out {
        securityProperty : WS_SECURITY_PROPERTY

    }

    /**
     * The id of the security property.  The following security
     *                     property constraints may be specified:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_property_id">WS_SECURITY_PROPERTY_TIMESTAMP_USAGE</a>
     * This property constraint may be specified when any 
     *                         of the following security bindings are specified:
     *                     
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_username_message_security_binding_constraint">WS_USERNAME_MESSAGE_SECURITY_BINDING_CONSTRAINT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_kerberos_apreq_message_security_binding_constraint">WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_CONSTRAINT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_cert_message_security_binding_constraint">WS_CERT_MESSAGE_SECURITY_BINDING_CONSTRAINT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_context_message_security_binding_constraint">WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_CONSTRAINT</a>
     * </li>
     * </ul>
     * If this property is not specified, then the default constraint value
     *                         of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_timestamp_usage">WS_SECURITY_TIMESTAMP_USAGE_ALWAYS</a> will be used.
     *                     
     * 
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_property_id">WS_SECURITY_PROPERTY_TRANSPORT_PROTECTION_LEVEL</a>
     * This property constraint may be specified when any
     *                         of the following security bindings are specified:
     *                     
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_ssl_transport_security_binding_constraint">WS_SSL_TRANSPORT_SECURITY_BINDING_CONSTRAINT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_tcp_sspi_transport_security_binding_constraint">WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_CONSTRAINT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_http_header_auth_security_binding_constraint">WS_HTTP_HEADER_AUTH_SECURITY_BINDING_CONSTRAINT</a>
     * </li>
     * </ul>
     * If this property is not specified, then the default constraint value
     *                         of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_protection_level">WS_PROTECTION_LEVEL_SIGN_AND_ENCRYPT</a> will be used.
     *                     
     * <b>WS_SECURITY_PROPERTY_SECURITY_HEADER_LAYOUT</b> This property constraint may be specified when any
     *                         of the following security bindings are specified:
     *                     
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_username_message_security_binding_constraint">WS_USERNAME_MESSAGE_SECURITY_BINDING_CONSTRAINT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_kerberos_apreq_message_security_binding_constraint">WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_CONSTRAINT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_cert_message_security_binding_constraint">WS_CERT_MESSAGE_SECURITY_BINDING_CONSTRAINT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_context_message_security_binding_constraint">WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_CONSTRAINT</a>
     * </li>
     * </ul>
     * If this property is not specified, then the default constraint value
     *                         of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_header_layout">WS_SECURITY_HEADER_LAYOUT_STRICT</a> will be used.
     *                     
     * <b>WS_SECURITY_PROPERTY_SECURITY_HEADER_VERSION</b>This property constraint may be specified when any
     *                         of the following security bindings are specified:
     *                     
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_username_message_security_binding_constraint">WS_USERNAME_MESSAGE_SECURITY_BINDING_CONSTRAINT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_kerberos_apreq_message_security_binding_constraint">WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_CONSTRAINT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_cert_message_security_binding_constraint">WS_CERT_MESSAGE_SECURITY_BINDING_CONSTRAINT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_context_message_security_binding_constraint">WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_CONSTRAINT</a>
     * </li>
     * </ul>
     * If this property is not specified, then the default constraint value
     *                         of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_header_version">WS_SECURITY_HEADER_VERSION_1_1</a> will be used.
     *                     
     * <b>WS_SECURITY_PROPERTY_ALGORITHM_SUITE_NAME</b>This property constraint may be specified when any
     *                     of the following security bindings are specified:
     *                   
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_username_message_security_binding_constraint">WS_USERNAME_MESSAGE_SECURITY_BINDING_CONSTRAINT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_kerberos_apreq_message_security_binding_constraint">WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_CONSTRAINT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_cert_message_security_binding_constraint">WS_CERT_MESSAGE_SECURITY_BINDING_CONSTRAINT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_context_message_security_binding_constraint">WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_CONSTRAINT</a>
     * </li>
     * </ul>
     * If this property is not specified, then the default constraint value
     *                     of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_suite_name">WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC256</a> will be used.
     *                   
     * 
     * </li>
     * </ul>
     */
    id : WS_SECURITY_PROPERTY_ID

    /**
     * An array of values which are acceptable.  The type of
     *                     the values in the array correspond to the type of the values
     *                     of the security property.  See the documentation for
     *                     a particular security property to determine the type of the
     *                     property.
     */
    allowedValues : IntPtr

    /**
     * The total size of the allowedValues array, in bytes.  This
     *                     size must be a multiple of the size of the type of the value
     *                     of the property.
     */
    allowedValuesSize : UInt32

    /**
     * When <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsmatchpolicyalternative">WsMatchPolicyAlternative</a> returns NOERROR, the
     *                     entire contents of this structure will be filled out.
     */
    out : WS_SECURITY_PROPERTY_CONSTRAINT._out

}
