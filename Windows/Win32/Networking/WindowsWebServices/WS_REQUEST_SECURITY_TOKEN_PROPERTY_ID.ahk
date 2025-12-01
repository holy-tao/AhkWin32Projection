#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the properties for requesting a security token from an issuer. It is used with WsRequestSecurityToken as part of the WS_REQUEST_SECURITY_TOKEN_PROPERTY* parameter.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_request_security_token_property_id
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_REQUEST_SECURITY_TOKEN_PROPERTY_ID extends Win32Enum{

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_endpoint_address">WS_ENDPOINT_ADDRESS</a> structure containing the address of the service ('relying party') to whom the requested
     * token will be presented.
     *                 .
     * @type {Integer (Int32)}
     */
    static WS_REQUEST_SECURITY_TOKEN_PROPERTY_APPLIES_TO => 1

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_trust_version">WS_TRUST_VERSION</a> value that specifies the version of WS-Trust to use.
     * 
     * If this property is not specified, it defaults to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_trust_version">WS_TRUST_VERSION_FEBRUARY_2005</a>.
     * @type {Integer (Int32)}
     */
    static WS_REQUEST_SECURITY_TOKEN_PROPERTY_TRUST_VERSION => 2

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_secure_conversation_version">WS_SECURE_CONVERSATION_VERSION</a> value that
     *             specifies the version of WS-SecureConversation to use when <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_request_security_token_action">WS_REQUEST_SECURITY_TOKEN_ACTION_NEW_CONTEXT</a> 
     *             or <b>WS_REQUEST_SECURITY_TOKEN_ACTION_RENEW_CONTEXT</b> are specified.
     *           
     * 
     * If this property is not specified, it defaults to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_secure_conversation_version">WS_SECURE_CONVERSATION_VERSION_FEBRUARY_2005</a>.
     * @type {Integer (Int32)}
     */
    static WS_REQUEST_SECURITY_TOKEN_PROPERTY_SECURE_CONVERSATION_VERSION => 3

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_string">WS_XML_STRING</a> structure that specifies the type of the security token to be issued.  If this property is not specified,
     *                     the corresponding element is not generated in the request security token message, and the
     *                     issuer is assumed to know the token type required.
     * @type {Integer (Int32)}
     */
    static WS_REQUEST_SECURITY_TOKEN_PROPERTY_ISSUED_TOKEN_TYPE => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_request_security_token_action">WS_REQUEST_SECURITY_TOKEN_ACTION</a> value that specifies the action to be used with the request. The default is <b>WS_REQUEST_SECURITY_TOKEN_ACTION_ISSUE</b>.
     * @type {Integer (Int32)}
     */
    static WS_REQUEST_SECURITY_TOKEN_PROPERTY_REQUEST_ACTION => 5

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-security-token">WS_SECURITY_TOKEN</a> structure that, 
     *             if specified, instead of requesting a new token, the provided token is renewed by requesting a new token based on 
     *             the existing one. The old token becomes invalid if this operation succeeds. 
     *             Only supported with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_request_security_token_action">WS_REQUEST_SECURITY_TOKEN_ACTION_RENEW_CONTEXT</a>.
     * @type {Integer (Int32)}
     */
    static WS_REQUEST_SECURITY_TOKEN_PROPERTY_EXISTING_TOKEN => 6

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_key_type">WS_SECURITY_KEY_TYPE</a> value that specifies the type of the cryptographic key to be requested for the
     *                     issued security token.                      This must be set to <b>WS_SECURITY_KEY_TYPE_NONE</b> or <b>WS_SECURITY_KEY_TYPE_SYMMETRIC</b>.
     * 
     * 
     * The value <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_key_type">WS_SECURITY_KEY_TYPE_NONE</a> specifies a bearer token without
     *                     proof-of-possession keys. Such tokens will not produce a signature when used to secure a message.
     *                 
     * 
     * If this property is not specified, the corresponding key type element is not emitted in token requests. 
     *                     Not emitting the key type in token requests results in the implied default of symmetric keys for the 
     *                     issued token, as defined in the WS-Trust specification.
     * @type {Integer (Int32)}
     */
    static WS_REQUEST_SECURITY_TOKEN_PROPERTY_ISSUED_TOKEN_KEY_TYPE => 7

    /**
     * A <b>ULONG</b> that specifies the size (in bits) of the cryptographic key to be requested
     *                     in the issued security token.  This property may be specified only for
     *                     issued tokens with symmetric keys.  If this property is not specified,
     *                     the corresponding key size element is not emitted in token requests.
     * @type {Integer (Int32)}
     */
    static WS_REQUEST_SECURITY_TOKEN_PROPERTY_ISSUED_TOKEN_KEY_SIZE => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_key_entropy_mode">WS_SECURITY_KEY_ENTROPY_MODE</a> value that specifies how entropy is contributed to the cryptographic key of the
     *                     issued token.  This property may be specified only for issued tokens
     *                     with symmetric keys.  If this property is not specified, the mode <b>WS_SECURITY_KEY_ENTROPY_MODE_SERVER_ONLY</b> is used.
     * @type {Integer (Int32)}
     */
    static WS_REQUEST_SECURITY_TOKEN_PROPERTY_ISSUED_TOKEN_KEY_ENTROPY => 9

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a> that contains
     *                     the additional primary parameters to be included verbatim in request
     *                     security token messages.  Each such parameter must be a top-level
     *                     element in the supplied XML buffer.  If this property is not specified, such
     *                     parameters are not emitted. The buffer is serialized into the RequestSecurityToken element 
     *                     when requesting a security token.
     *                 
     * 
     * Unlike <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_request_security_token_property_id">WS_REQUEST_SECURITY_TOKEN_PROPERTY_SERVICE_REQUEST_PARAMETERS</a>, local request 
     *                     parameters are defined by the client as a means to add parameters to the token request.
     * @type {Integer (Int32)}
     */
    static WS_REQUEST_SECURITY_TOKEN_PROPERTY_LOCAL_REQUEST_PARAMETERS => 10

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a> that contains
     *                     the service parameters to include in request security token
     *                     messages, supplied as an XML buffer. Each such parameter must be a
     *                     top-level element in the supplied XML buffer. If this is property not specified, such
     *                     parameters are not emitted.
     *                 
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_trust_version">WS_TRUST_VERSION_FEBRUARY_2005</a> is specified this buffer is serialized
     *                     into the RequestSecurityToken element following the
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_request_security_token_property_id">WS_REQUEST_SECURITY_TOKEN_PROPERTY_LOCAL_REQUEST_PARAMETERS</a>.
     *                 
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_trust_version">WS_TRUST_VERSION_1_3</a> is specified this buffer is serialized into the
     *                     RequestSecurityToken/SecondaryParameters element.
     *                  
     * 
     * Service request parameters are instructions regarding how to issue a token. They are obtained from the service, 
     *                    usually by means of metadata import. In that case, this parameter may be obtained 
     *                    from the out.RequestSecurityTokenTemplate field of the <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_issued_token_message_security_binding_constraint">WS_ISSUED_TOKEN_MESSAGE_SECURITY_BINDING_CONSTRAINT</a>.
     * @type {Integer (Int32)}
     */
    static WS_REQUEST_SECURITY_TOKEN_PROPERTY_SERVICE_REQUEST_PARAMETERS => 11

    /**
     * The set of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_properties">WS_MESSAGE_PROPERTIES</a> to be specified
     *                     while creating the two messages with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatemessage">WsCreateMessage</a> and are to
     *                     be used for the security token obtaining exchange.  If this property
     *                     is not specified, the request and reply messages are created with the
     *                     default message properties.
     * @type {Integer (Int32)}
     */
    static WS_REQUEST_SECURITY_TOKEN_PROPERTY_MESSAGE_PROPERTIES => 12

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_REQUEST_SECURITY_TOKEN_PROPERTY_BEARER_KEY_TYPE_VERSION => 13
}
