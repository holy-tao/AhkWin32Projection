#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the network type of a vSwitch.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ne-fwptypes-fwp_vswitch_network_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWP_VSWITCH_NETWORK_TYPE{

    /**
     * Specifies an unknown network type.
     * @type {Integer (Int32)}
     */
    static FWP_VSWITCH_NETWORK_TYPE_UNKNOWN => 0

    /**
     * Specifies a private network.
     * @type {Integer (Int32)}
     */
    static FWP_VSWITCH_NETWORK_TYPE_PRIVATE => 1

    /**
     * Specifies an internal network.
     * @type {Integer (Int32)}
     */
    static FWP_VSWITCH_NETWORK_TYPE_INTERNAL => 2

    /**
     * Specifies an external network.
     * @type {Integer (Int32)}
     */
    static FWP_VSWITCH_NETWORK_TYPE_EXTERNAL => 3
}
