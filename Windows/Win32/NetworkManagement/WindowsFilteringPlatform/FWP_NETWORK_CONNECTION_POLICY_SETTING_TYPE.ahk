#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWP_NETWORK_CONNECTION_POLICY_SETTING_TYPE extends Win32Enum {

    /**
     * Native name: FWP_NETWORK_CONNECTION_POLICY_SOURCE_ADDRESS
     * @type {Integer (Int32)}
     */
    static SOURCE_ADDRESS => 0

    /**
     * Native name: FWP_NETWORK_CONNECTION_POLICY_NEXT_HOP_INTERFACE
     * @type {Integer (Int32)}
     */
    static NEXT_HOP_INTERFACE => 1

    /**
     * Native name: FWP_NETWORK_CONNECTION_POLICY_NEXT_HOP
     * @type {Integer (Int32)}
     */
    static NEXT_HOP => 2

    /**
     * Native name: FWP_NETWORK_CONNECTION_POLICY_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 3
}
