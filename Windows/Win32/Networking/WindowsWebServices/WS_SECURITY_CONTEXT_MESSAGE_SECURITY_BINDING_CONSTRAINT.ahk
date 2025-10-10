#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_BINDING_CONSTRAINT.ahk

/**
 * A security binding constraint that corresponds to the WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_security_context_message_security_binding_constraint
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURITY_CONTEXT_MESSAGE_SECURITY_BINDING_CONSTRAINT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The base binding constraint that this binding constraint derives from.
     *         
     * 
     * The following binding constraints are supported at this point: <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_binding_property_id">WS_SECURITY_BINDING_PROPERTY_SECURE_CONVERSATION_VERSION</a> 
     *           and <b>WS_SECURITY_BINDING_PROPERTY_SECURITY_CONTEXT_KEY_ENTROPY_MODE</b>. 
     *            Currently only <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_secure_conversation_version">WS_SECURE_CONVERSATION_VERSION_FEBRUARY_2005</a>is supported in policy, so a binding constraint containing the
     *           value <b>WS_SECURE_CONVERSATION_VERSION_FEBRUARY_2005</b> must be specified in
     *           order for the policy to match.
     * @type {WS_SECURITY_BINDING_CONSTRAINT}
     */
    bindingConstraint{
        get {
            if(!this.HasProp("__bindingConstraint"))
                this.__bindingConstraint := WS_SECURITY_BINDING_CONSTRAINT(this.ptr + 0)
            return this.__bindingConstraint
        }
    }

    /**
     * This specifies how the security context token should be attached to a message.
     * @type {Integer}
     */
    bindingUsage {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * This specifies the bootstrap security used to establish the secure conversation context.
     * @type {Pointer<WS_SECURITY_CONSTRAINTS>}
     */
    bootstrapSecurityConstraint {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
