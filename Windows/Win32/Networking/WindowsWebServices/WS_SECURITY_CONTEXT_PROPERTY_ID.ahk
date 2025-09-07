#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies a property of a security context object. This enumeration is used with WsGetSecurityContextProperty.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_security_context_property_id
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURITY_CONTEXT_PROPERTY_ID{

    /**
     * On the wire, a security context is identified by an absolute URI, which is unique to both sender and 
 *           recipient. See <a href="https://docs.oasis-open.org/ws-sx/ws-secureconversation/200512/ws-secureconversation-1.3-os.html">WS-SecureConversation</a>.
 *           This property is a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_unique_id">WS_UNIQUE_ID</a> structure that represents that URI.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_CONTEXT_PROPERTY_IDENTIFIER => 1

    /**
     * If a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_username_message_security_binding">WS_USERNAME_MESSAGE_SECURITY_BINDING</a> is used as bootstrap security, this property
 *           is a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_string">WS_STRING</a> that represents the username that was used during the establishment of the security context.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_CONTEXT_PROPERTY_USERNAME => 2

    /**
     * If a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_kerberos_apreq_message_security_binding">WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING</a> is used as bootstrap security, this property
 *           is a <b>HANDLE</b> that represents the token that was used during the establishment of the security context.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_CONTEXT_PROPERTY_MESSAGE_SECURITY_WINDOWS_TOKEN => 3

    /**
     * If a <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_saml_message_security_binding">WS_SAML_MESSAGE_SECURITY_BINDING</a> is used as bootstrap security, this property
 *           is a pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a> that represents the SAML assertion that was used during the establishment of the security context.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_CONTEXT_PROPERTY_SAML_ASSERTION => 4
}
