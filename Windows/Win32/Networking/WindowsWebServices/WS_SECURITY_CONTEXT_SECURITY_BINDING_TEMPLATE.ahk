#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_BINDING_PROPERTIES.ahk
#Include .\WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_TEMPLATE.ahk
#Include .\WS_SECURITY_PROPERTIES.ahk

/**
 * The security binding template for specifying the use of an application supplied security context security binding. (WS_SECURITY_CONTEXT_SECURITY_BINDING_TEMPLATE)
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_context_security_binding_template
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURITY_CONTEXT_SECURITY_BINDING_TEMPLATE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Application provided security binding properties that cannot be represented in policy.
     * @type {WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_TEMPLATE}
     */
    securityContextMessageSecurityBinding{
        get {
            if(!this.HasProp("__securityContextMessageSecurityBinding"))
                this.__securityContextMessageSecurityBinding := WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_TEMPLATE(0, this)
            return this.__securityContextMessageSecurityBinding
        }
    }

    /**
     * Application provided additional security properties for the service channel
     *           that cannot be represented in policy. Only policy specified security properties is used if no additional properties are specified here.
     * @type {WS_SECURITY_PROPERTIES}
     */
    securityProperties{
        get {
            if(!this.HasProp("__securityProperties"))
                this.__securityProperties := WS_SECURITY_PROPERTIES(16, this)
            return this.__securityProperties
        }
    }
}
