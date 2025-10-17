#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_BINDING_PROPERTIES.ahk
#Include .\WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION.ahk
#Include .\WS_SECURITY_PROPERTIES.ahk

/**
 * This type description is used with template APIs to describe the security context related templates generated accordingly to input policy setting.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_security_context_security_binding_policy_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURITY_CONTEXT_SECURITY_BINDING_POLICY_DESCRIPTION extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Specifies the message security binding usage.
     * @type {WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION}
     */
    securityContextMessageSecurityBinding{
        get {
            if(!this.HasProp("__securityContextMessageSecurityBinding"))
                this.__securityContextMessageSecurityBinding := WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_POLICY_DESCRIPTION(0, this)
            return this.__securityContextMessageSecurityBinding
        }
    }

    /**
     * Specifies the security properties for the service channel according to the spcific policy.
     * @type {WS_SECURITY_PROPERTIES}
     */
    securityProperties{
        get {
            if(!this.HasProp("__securityProperties"))
                this.__securityProperties := WS_SECURITY_PROPERTIES(24, this)
            return this.__securityProperties
        }
    }
}
