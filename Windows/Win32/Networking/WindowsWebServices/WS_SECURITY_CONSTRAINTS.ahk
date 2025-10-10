#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure specifies the security related constraints as part of WS_POLICY_CONSTRAINTS.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_security_constraints
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURITY_CONSTRAINTS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * An array of security property constraints which override the default
     *                     set of constraints.  The constraints specified here, combined
     *                     with the default set of constraints limits the set of policies
     *                     that will be matched.
     *                 
     * 
     * If a security property constraint is not specified for a given property,
     *                     then a default constraint value will be used.
     *                     See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_property_constraint">WS_SECURITY_PROPERTY_CONSTRAINT</a> for the
     *                     supported set of properties and their default values.
     *                 
     * 
     * Note that the defaults constraints for <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_property_constraint">WS_SECURITY_PROPERTY_CONSTRAINT</a> 
     *                     are the same as the defaults for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_security_property">WS_SECURITY_PROPERTY</a>.
     * @type {Pointer<WS_SECURITY_PROPERTY_CONSTRAINT>}
     */
    securityPropertyConstraints {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of elements specified in the securityPropertyConstraints
     *                     array.
     *                 
     * 
     * If this value is 0, then the securityPropertyConstraints array may be <b>NULL</b>.
     * @type {Integer}
     */
    securityPropertyConstraintCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Any array of security binding constraints which taken as a unit specify
     *                     the type of security to match in the policy.
     *                 
     * 
     * The type of each <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_constraint">WS_SECURITY_BINDING_CONSTRAINT</a> corresponds
     *                     to the types of security that is specified using a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_security_binding">WS_SECURITY_BINDING</a>structure.  Each security binding specifies one security token, and similarly,
     *                     each security binding constraint specifies constraints on one security token.
     *                 
     * 
     * Specifying zero constraints indicates no security.
     * @type {Pointer<WS_SECURITY_BINDING_CONSTRAINT>}
     */
    securityBindingConstraints {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The number of elements specified in the securityBindingConstraints
     *                     array.
     *                 
     * 
     * If this value is 0, then the securityBindingConstraints array may be <b>NULL</b>.
     * @type {Integer}
     */
    securityBindingConstraintCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
