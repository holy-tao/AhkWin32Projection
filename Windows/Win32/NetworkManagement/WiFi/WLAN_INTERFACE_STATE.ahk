#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_INTERFACE_STATE{

    /**
     * @type {Integer (Int32)}
     */
    static wlan_interface_state_not_ready => 0

    /**
     * @type {Integer (Int32)}
     */
    static wlan_interface_state_connected => 1

    /**
     * @type {Integer (Int32)}
     */
    static wlan_interface_state_ad_hoc_network_formed => 2

    /**
     * @type {Integer (Int32)}
     */
    static wlan_interface_state_disconnecting => 3

    /**
     * @type {Integer (Int32)}
     */
    static wlan_interface_state_disconnected => 4

    /**
     * @type {Integer (Int32)}
     */
    static wlan_interface_state_associating => 5

    /**
     * @type {Integer (Int32)}
     */
    static wlan_interface_state_discovering => 6

    /**
     * @type {Integer (Int32)}
     */
    static wlan_interface_state_authenticating => 7
}
