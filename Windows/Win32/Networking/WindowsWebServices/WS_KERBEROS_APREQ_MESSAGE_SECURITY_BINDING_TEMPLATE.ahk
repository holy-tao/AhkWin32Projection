#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_BINDING_PROPERTIES.ahk

/**
 * The security binding template for specifying the use of the Kerberos AP_REQ ticket as a direct (i.e., without establishing a session) security token with WS-Security.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_kerberos_apreq_message_security_binding_template
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_TEMPLATE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Application provided security binding properties that cannot be represented in policy.
     * @type {WS_SECURITY_BINDING_PROPERTIES}
     */
    securityBindingProperties{
        get {
            if(!this.HasProp("__securityBindingProperties"))
                this.__securityBindingProperties := WS_SECURITY_BINDING_PROPERTIES(this.ptr + 0)
            return this.__securityBindingProperties
        }
    }

    /**
     * The Windows credential to be used to obtain the Kerberos ticket.  This
     *           field is required on the client side, but must be <b>NULL</b> on the server
     *           side.
     * @type {Pointer<WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL>}
     */
    clientCredential {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
