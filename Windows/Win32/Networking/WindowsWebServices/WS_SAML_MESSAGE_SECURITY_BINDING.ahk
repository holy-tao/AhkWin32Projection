#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_BINDING.ahk

/**
 * The security binding subtype for specifying the use of a SAML assertion as a message security token.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_saml_message_security_binding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SAML_MESSAGE_SECURITY_BINDING extends Win32Struct
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
                this.__binding := WS_SECURITY_BINDING(this.ptr + 0)
            return this.__binding
        }
    }

    /**
     * How the security token corresponding to this security binding should be bound to a message.
     *                 
     * Only <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_security_usage">WS_SUPPORTING_MESSAGE_SECURITY_USAGE</a> is
     * 
     * supported.  With this usage, this security binding provides client
     * authentication, but not message protection (such as signing,
     * encryption, replay detection).  Thus, this binding must be used
     * together with another security binding such as the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_ssl_transport_security_binding">WS_SSL_TRANSPORT_SECURITY_BINDING</a> that provides a protected
     * channel.
     *                 
     * 
     * To use this binding on HTTP without SSL, the security description property <b>WS_SECURITY_PROPERTY_TRANSPORT_PROTECTION_LEVEL</b> must be explicitly set to <b>WS_PROTECTION_LEVEL_NONE</b>. This is not supported on the client or on TCP.
     * @type {Integer}
     */
    bindingUsage {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * The authenticator for validating incoming SAML tokens.  This field is
     * required.
     * @type {Pointer<WS_SAML_AUTHENTICATOR>}
     */
    authenticator {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
