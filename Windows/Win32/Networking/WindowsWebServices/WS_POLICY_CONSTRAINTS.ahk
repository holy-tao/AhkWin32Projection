#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_CHANNEL_BINDING.ahk" { WS_CHANNEL_BINDING }
#Import ".\WS_CHANNEL_PROPERTY_CONSTRAINT.ahk" { WS_CHANNEL_PROPERTY_CONSTRAINT }
#Import ".\WS_SECURITY_CONSTRAINTS.ahk" { WS_SECURITY_CONSTRAINTS }
#Import ".\WS_POLICY_EXTENSION.ahk" { WS_POLICY_EXTENSION }

/**
 * Specifies policy constraints for a channel.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_policy_constraints
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_POLICY_CONSTRAINTS {
    #StructPack 8

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
     */
    channelBinding : WS_CHANNEL_BINDING

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
     */
    channelPropertyConstraints : WS_CHANNEL_PROPERTY_CONSTRAINT.Ptr

    /**
     * The number of elements specified in the <b>channelPropertyConstraints</b> array.  
     *                 
     * 
     * If this value is 0, then the channelPropertyConstraints array may be <b>NULL</b>.
     */
    channelPropertyConstraintCount : UInt32

    /**
     * Constraints on the type of security that may be used.
     *                 
     * 
     * Setting this field to <b>NULL</b> indicates a constraint of no security.
     */
    securityConstraints : WS_SECURITY_CONSTRAINTS.Ptr

    policyExtensions : IntPtr

    policyExtensionCount : UInt32

}
