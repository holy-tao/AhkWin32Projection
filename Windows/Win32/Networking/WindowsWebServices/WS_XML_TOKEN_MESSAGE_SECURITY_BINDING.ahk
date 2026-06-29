#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SECURITY_TOKEN.ahk" { WS_SECURITY_TOKEN }
#Import ".\WS_MESSAGE_SECURITY_USAGE.ahk" { WS_MESSAGE_SECURITY_USAGE }
#Import ".\WS_SECURITY_BINDING.ahk" { WS_SECURITY_BINDING }
#Import ".\WS_SECURITY_BINDING_PROPERTY.ahk" { WS_SECURITY_BINDING_PROPERTY }
#Import ".\WS_SECURITY_BINDING_TYPE.ahk" { WS_SECURITY_BINDING_TYPE }

/**
 * The security binding subtype for specifying the use of a security token that is already available to the application in XML form.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_token_message_security_binding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_TOKEN_MESSAGE_SECURITY_BINDING {
    #StructPack 8

    /**
     * The base type from which this security binding subtype and all other security binding subtypes derive.
     */
    binding : WS_SECURITY_BINDING

    /**
     * How the security token corresponding to this security binding should be bound to a message.
     *                 
     * 
     * Only <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_security_usage">WS_SUPPORTING_MESSAGE_SECURITY_USAGE</a> is
     * supported.  With this usage, this security binding provides client
     * authentication, but not message protection (such as signing,
     * encryption, replay detection).  Thus, this binding must be used
     * together with another security binding such as the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_ssl_transport_security_binding">WS_SSL_TRANSPORT_SECURITY_BINDING</a> that provides a protected
     * channel.
     */
    bindingUsage : WS_MESSAGE_SECURITY_USAGE

    /**
     * The XML security token to be used.  This token may be created using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatexmlsecuritytoken">WsCreateXmlSecurityToken</a> or obtained from a security token
     * service using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsrequestsecuritytoken">WsRequestSecurityToken</a>.  When this binding is
     * used for creating a channel, a copy of the supplied token is made and
     * kept for internal use -- the application continues to own the supplied
     * token and is responsible for deleting it with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreesecuritytoken">WsFreeSecurityToken</a> any time after the channel creation call
     * returns.
     */
    xmlToken : WS_SECURITY_TOKEN.Ptr

}
