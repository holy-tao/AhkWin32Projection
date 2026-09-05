#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the network type of a vSwitch.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ne-fwptypes-fwp_vswitch_network_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWP_VSWITCH_NETWORK_TYPE extends Win32Enum {

    /**
     * Specifies an unknown network type.
     * Native name: FWP_VSWITCH_NETWORK_TYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Specifies a private network.
     * Native name: FWP_VSWITCH_NETWORK_TYPE_PRIVATE
     * @type {Integer (Int32)}
     */
    static PRIVATE => 1

    /**
     * Specifies an internal network.
     * Native name: FWP_VSWITCH_NETWORK_TYPE_INTERNAL
     * @type {Integer (Int32)}
     */
    static INTERNAL => 2

    /**
     * Specifies an external network.
     * Native name: FWP_VSWITCH_NETWORK_TYPE_EXTERNAL
     * @type {Integer (Int32)}
     */
    static EXTERNAL => 3
}
