#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_MESSAGE_SECURITY_USAGE.ahk" { WS_MESSAGE_SECURITY_USAGE }
#Import ".\WS_SECURITY_BINDING_PROPERTY_CONSTRAINT.ahk" { WS_SECURITY_BINDING_PROPERTY_CONSTRAINT }
#Import ".\WS_SECURITY_BINDING_CONSTRAINT.ahk" { WS_SECURITY_BINDING_CONSTRAINT }
#Import ".\WS_SECURITY_BINDING_CONSTRAINT_TYPE.ahk" { WS_SECURITY_BINDING_CONSTRAINT_TYPE }

/**
 * A security binding constraint that corresponds to the WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_kerberos_apreq_message_security_binding_constraint
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_KERBEROS_APREQ_MESSAGE_SECURITY_BINDING_CONSTRAINT {
    #StructPack 8

    /**
     * The base binding constraint that this binding constraint derives from.
     *                 
     * 
     * There are no binding-specific properties are defined for this binding constraint
     *                     at this time.
     */
    bindingConstraint : WS_SECURITY_BINDING_CONSTRAINT

    /**
     * This specifies how the security token corresponding to this security 
     *                     binding should be attached to a message.
     */
    bindingUsage : WS_MESSAGE_SECURITY_USAGE

}
