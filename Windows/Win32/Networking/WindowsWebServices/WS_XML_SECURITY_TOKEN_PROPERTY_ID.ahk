#Requires AutoHotkey v2.0.0 64-bit

/**
 * The keys for the bag of properties for the creation of XML security tokens. This enumeration is used within the WS_XML_SECURITY_TOKEN_PROPERTY structure, which is used as parameter for WsCreateXmlSecurityToken.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_security_token_property_id
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_SECURITY_TOKEN_PROPERTY_ID{

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a> that contains
 * the XML form of the reference to be used for this token (from a
 * signature, for example) when the token is attached to (for example, serialized
 * in) a message.  This is required if and only if the token is a
 * proof-of-possession token.  If specified, the XML buffer must have
 * exactly one top level XML element.
     * @type {Integer (Int32)}
     */
    static WS_XML_SECURITY_TOKEN_PROPERTY_ATTACHED_REFERENCE => 1

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a> that contains the XML form of the reference to be used for this token (from a
 * signature, for example) when the token is not attached to a message.  This
 * should be specified only if the token is a proof-of-possession token,
 * and is used without being serialized in the message.  If specified,
 * the XML buffer must have exactly one top level XML element.
     * @type {Integer (Int32)}
     */
    static WS_XML_SECURITY_TOKEN_PROPERTY_UNATTACHED_REFERENCE => 2

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_datetime">WS_DATETIME</a> structure that contains the time from when the security token is valid.
     * @type {Integer (Int32)}
     */
    static WS_XML_SECURITY_TOKEN_PROPERTY_VALID_FROM_TIME => 3

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_datetime">WS_DATETIME</a> structure that contains the time until when the security token is valid.
     * @type {Integer (Int32)}
     */
    static WS_XML_SECURITY_TOKEN_PROPERTY_VALID_TILL_TIME => 4
}
