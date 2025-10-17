#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_BINDING_PROPERTIES.ahk

/**
 * The security binding template for specifying the use of Windows SSPI protocol based transport security.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_tcp_sspi_transport_security_binding_template
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_TCP_SSPI_TRANSPORT_SECURITY_BINDING_TEMPLATE extends Win32Struct
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
                this.__securityBindingProperties := WS_SECURITY_BINDING_PROPERTIES(0, this)
            return this.__securityBindingProperties
        }
    }

    /**
     * The Windows credential to be used to obtain this security token.  This
     *           is required on the client and must not be specified on the server.
     * @type {Pointer<WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL>}
     */
    clientCredential {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
