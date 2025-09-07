#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_BINDING_PROPERTIES.ahk

/**
 * The security binding template for specifying the use of an application supplied security context security binding. (WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_TEMPLATE)
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_context_message_security_binding_template
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_TEMPLATE extends Win32Struct
{
    static sizeof => 16

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
}
