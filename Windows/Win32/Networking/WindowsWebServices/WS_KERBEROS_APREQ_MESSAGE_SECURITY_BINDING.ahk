#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_BINDING.ahk

/**
 * The security binding subtype for specifying the use of the Kerberos AP_REQ ticket as a direct (i.e., without establishing a session) security token with WS-Security.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_kerberos_apreq_message_security_binding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING extends Win32Struct
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
     * How the security token corresponding to this security binding should
     * be attached to a message.
     *                 
     * 
     * Only <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_security_usage">WS_SUPPORTING_MESSAGE_SECURITY_USAGE</a> is supported. With this usage, this security binding provides client authentication, but not message protection (such as signing, encryption, replay detection). Consequently, this binding is generally used together with another security binding such as the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_ssl_transport_security_binding">WS_SSL_TRANSPORT_SECURITY_BINDING</a> that provides a protected channel.
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
     * The Windows Integrated Authentication credential to be used to obtain
     * the Kerberos ticket.  This field is required on the client side, but
     * must be <b>NULL</b> on the server side.
     * @type {Pointer<WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL>}
     */
    clientCredential {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
