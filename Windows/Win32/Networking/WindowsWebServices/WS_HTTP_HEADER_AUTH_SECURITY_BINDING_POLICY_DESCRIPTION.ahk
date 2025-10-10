#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_BINDING_PROPERTIES.ahk

/**
 * This type description is used with template APIs to describe the templates generated accordingly to input policy setting.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_http_header_auth_security_binding_policy_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_HTTP_HEADER_AUTH_SECURITY_BINDING_POLICY_DESCRIPTION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the security binding properties according to the specific policy.
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
