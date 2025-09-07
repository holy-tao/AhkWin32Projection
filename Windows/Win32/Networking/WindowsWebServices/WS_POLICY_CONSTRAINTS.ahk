#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies policy constraints for a channel.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_policy_constraints
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_POLICY_CONSTRAINTS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Which channel binding is required.  The
     *                     following values are supported:
     *                 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_HTTP_CHANNEL_BINDING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_TCP_CHANNEL_BINDING</a>
     * </li>
     * </ul>
     * @type {Integer}
     */
    channelBinding {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An array of channel property constraints which override the default
     *                     set of constraints.  The constraints specified here, combined
     *                     with the default set of constraints limits the set of policies
     *                     that will be matched.
     *                 
     * 
     * If a channel property constraint is not specified for a given property,
     *                     then a default constraint value will be used.
     *                     See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_channel_property_constraint">WS_CHANNEL_PROPERTY_CONSTRAINT</a> for the
     *                     supported set of properties and their default values.
     * @type {Pointer<WS_CHANNEL_PROPERTY_CONSTRAINT>}
     */
    channelPropertyConstraints {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The number of elements specified in the <b>channelPropertyConstraints</b> array.  
     *                 
     * 
     * If this value is 0, then the channelPropertyConstraints array may be <b>NULL</b>.
     * @type {Integer}
     */
    channelPropertyConstraintCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Constraints on the type of security that may be used.
     *                 
     * 
     * Setting this field to <b>NULL</b> indicates a constraint of no security.
     * @type {Pointer<WS_SECURITY_CONSTRAINTS>}
     */
    securityConstraints {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * 
     * @type {Pointer<WS_POLICY_EXTENSION>}
     */
    policyExtensions {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * 
     * @type {Integer}
     */
    policyExtensionCount {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
