#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_MESSAGE_SECURITY_USAGE.ahk" { WS_MESSAGE_SECURITY_USAGE }
#Import ".\WS_SECURITY_BINDING_PROPERTY_CONSTRAINT.ahk" { WS_SECURITY_BINDING_PROPERTY_CONSTRAINT }
#Import ".\WS_SECURITY_BINDING_CONSTRAINT.ahk" { WS_SECURITY_BINDING_CONSTRAINT }
#Import ".\WS_SECURITY_BINDING_CONSTRAINT_TYPE.ahk" { WS_SECURITY_BINDING_CONSTRAINT_TYPE }
#Import ".\WS_SECURITY_CONSTRAINTS.ahk" { WS_SECURITY_CONSTRAINTS }

/**
 * A security binding constraint that corresponds to the WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_context_message_security_binding_constraint
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_CONSTRAINT {
    #StructPack 8

    /**
     * The base binding constraint that this binding constraint derives from.
     *         
     * 
     * The following binding constraints are supported at this point: <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_binding_property_id">WS_SECURITY_BINDING_PROPERTY_SECURE_CONVERSATION_VERSION</a> 
     *           and <b>WS_SECURITY_BINDING_PROPERTY_SECURITY_CONTEXT_KEY_ENTROPY_MODE</b>. 
     *            Currently only <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_secure_conversation_version">WS_SECURE_CONVERSATION_VERSION_FEBRUARY_2005</a> is supported in policy, so a binding constraint containing the
     *           value <b>WS_SECURE_CONVERSATION_VERSION_FEBRUARY_2005</b> must be specified in
     *           order for the policy to match.
     */
    bindingConstraint : WS_SECURITY_BINDING_CONSTRAINT

    /**
     * This specifies how the security context token should be attached to a message.
     */
    bindingUsage : WS_MESSAGE_SECURITY_USAGE

    /**
     * This specifies the bootstrap security used to establish the secure conversation context.
     */
    bootstrapSecurityConstraint : WS_SECURITY_CONSTRAINTS.Ptr

}
