#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_BINDING_PROPERTIES.ahk

/**
 * The security binding template for specifying the use of HTP header authentication protocol based security.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_http_header_auth_security_binding_template
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_HTTP_HEADER_AUTH_SECURITY_BINDING_TEMPLATE extends Win32Struct
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
     * The Windows credential to be used to obtain this security token.  This
     *           is required on the client side and must be <b>NULL</b> on the server side.
     * @type {Pointer<WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL>}
     */
    clientCredential {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
