#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a property of a connection.
 * @see https://learn.microsoft.com/windows/win32/api/wcmapi/ne-wcmapi-wcm_property
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 */
class WCM_PROPERTY extends Win32Enum {

    /**
     * Domain policy.
     * Native name: wcm_global_property_domain_policy
     * @type {Integer (Int32)}
     */
    static global_property_domain_policy => 0

    /**
     * Minimize policy.
     * Native name: wcm_global_property_minimize_policy
     * @type {Integer (Int32)}
     */
    static global_property_minimize_policy => 1

    /**
     * Roaming policy.
     * Native name: wcm_global_property_roaming_policy
     * @type {Integer (Int32)}
     */
    static global_property_roaming_policy => 2

    /**
     * Power management policy.
     * Native name: wcm_global_property_powermanagement_policy
     * @type {Integer (Int32)}
     */
    static global_property_powermanagement_policy => 3

    /**
     * The cost level and flags for the connection
     * Native name: wcm_intf_property_connection_cost
     * @type {Integer (Int32)}
     */
    static intf_property_connection_cost => 4

    /**
     * The plan data associated with the new cost.
     * Native name: wcm_intf_property_dataplan_status
     * @type {Integer (Int32)}
     */
    static intf_property_dataplan_status => 5

    /**
     * The hotspot profile.
     * Native name: wcm_intf_property_hotspot_profile
     * @type {Integer (Int32)}
     */
    static intf_property_hotspot_profile => 6
}
