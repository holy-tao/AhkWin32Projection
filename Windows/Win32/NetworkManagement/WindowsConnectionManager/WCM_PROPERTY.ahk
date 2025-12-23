#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a property of a connection.
 * @see https://learn.microsoft.com/windows/win32/api/wcmapi/ne-wcmapi-wcm_property
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 * @version v4.0.30319
 */
class WCM_PROPERTY extends Win32Enum{

    /**
     * Domain policy.
     * @type {Integer (Int32)}
     */
    static wcm_global_property_domain_policy => 0

    /**
     * Minimize policy.
     * @type {Integer (Int32)}
     */
    static wcm_global_property_minimize_policy => 1

    /**
     * Roaming policy.
     * @type {Integer (Int32)}
     */
    static wcm_global_property_roaming_policy => 2

    /**
     * Power management policy.
     * @type {Integer (Int32)}
     */
    static wcm_global_property_powermanagement_policy => 3

    /**
     * The cost level and flags for the connection
     * @type {Integer (Int32)}
     */
    static wcm_intf_property_connection_cost => 4

    /**
     * The plan data associated with the new cost.
     * @type {Integer (Int32)}
     */
    static wcm_intf_property_dataplan_status => 5

    /**
     * The hotspot profile.
     * @type {Integer (Int32)}
     */
    static wcm_intf_property_hotspot_profile => 6
}
