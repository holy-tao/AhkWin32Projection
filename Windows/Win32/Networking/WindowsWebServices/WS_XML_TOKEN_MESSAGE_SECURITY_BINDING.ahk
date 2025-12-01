#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_BINDING.ahk

/**
 * The security binding subtype for specifying the use of a security token that is already available to the application in XML form.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_token_message_security_binding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_TOKEN_MESSAGE_SECURITY_BINDING extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The base type from which this security binding subtype and all other security binding subtypes derive.
     * @type {WS_SECURITY_BINDING}
     */
    binding{
        get {
            if(!this.HasProp("__binding"))
                this.__binding := WS_SECURITY_BINDING(0, this)
            return this.__binding
        }
    }

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
     * @type {Integer}
     */
    bindingUsage {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * The XML security token to be used.  This token may be created using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatexmlsecuritytoken">WsCreateXmlSecurityToken</a> or obtained from a security token
     * service using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsrequestsecuritytoken">WsRequestSecurityToken</a>.  When this binding is
     * used for creating a channel, a copy of the supplied token is made and
     * kept for internal use -- the application continues to own the supplied
     * token and is responsible for deleting it with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreesecuritytoken">WsFreeSecurityToken</a> any time after the channel creation call
     * returns.
     * @type {Pointer<WS_SECURITY_TOKEN>}
     */
    xmlToken {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
