#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWP_NETWORK_CONNECTION_POLICY_SETTING_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FWP_NETWORK_CONNECTION_POLICY_SOURCE_ADDRESS => 0

    /**
     * @type {Integer (Int32)}
     */
    static FWP_NETWORK_CONNECTION_POLICY_NEXT_HOP_INTERFACE => 1

    /**
     * @type {Integer (Int32)}
     */
    static FWP_NETWORK_CONNECTION_POLICY_NEXT_HOP => 2

    /**
     * @type {Integer (Int32)}
     */
    static FWP_NETWORK_CONNECTION_POLICY_MAX => 3
}
