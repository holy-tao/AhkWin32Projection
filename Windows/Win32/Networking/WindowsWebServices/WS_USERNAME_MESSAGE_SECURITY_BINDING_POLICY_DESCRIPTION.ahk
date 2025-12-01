#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_BINDING_PROPERTIES.ahk

/**
 * This type description is used with template APIs to describe the templates generated accordingly to input policy setting. (WS_USERNAME_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION)
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_username_message_security_binding_policy_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_USERNAME_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies the security binding properties according to the specific policy.
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
     * Specifies the message security binding usage.
     * @type {Integer}
     */
    bindingUsage {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
