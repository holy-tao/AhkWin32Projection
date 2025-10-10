#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_BINDING_PROPERTIES.ahk

/**
 * The security binding template for specifying the use of SSL/TLS protocol based transport security.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_ssl_transport_security_binding_template
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SSL_TRANSPORT_SECURITY_BINDING_TEMPLATE extends Win32Struct
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
     * The local certificate credential to be used with this security binding.
     *         
     * 
     * Server side: When SSL is used for transport security with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_HTTP_CHANNEL_BINDING</a>, the server certificate must be
     *           registered by the application using the <a href="https://docs.microsoft.com/windows/win32/http/httpcfg-exe">HttpCfg.exe</a> and this field must be set to <b>NULL</b>.  In all other cases, the
     *           server SSL certificate must be specified using this field.
     *         
     * 
     * Client side: If a client certificate is to be used with SSL, it must
     *           be specified using this field.  If no client certificate is to be
     *           used, this field must be set to <b>NULL</b>.
     * @type {Pointer<WS_CERT_CREDENTIAL>}
     */
    localCertCredential {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
