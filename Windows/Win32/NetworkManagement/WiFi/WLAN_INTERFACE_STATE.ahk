#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WLAN_INTERFACE_STATE enumeration indicates the state of an interface.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_interface_state~r1
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_INTERFACE_STATE{

    /**
     * The interface is not ready to operate.
     * @type {Integer (Int32)}
     */
    static wlan_interface_state_not_ready => 0

    /**
     * The interface is connected to a network.
     * @type {Integer (Int32)}
     */
    static wlan_interface_state_connected => 1

    /**
     * The interface is the first node in an ad hoc network.  No peer has connected.
     * @type {Integer (Int32)}
     */
    static wlan_interface_state_ad_hoc_network_formed => 2

    /**
     * The interface is disconnecting from the current network.
     * @type {Integer (Int32)}
     */
    static wlan_interface_state_disconnecting => 3

    /**
     * The interface is not connected to any network.
     * @type {Integer (Int32)}
     */
    static wlan_interface_state_disconnected => 4

    /**
     * The interface is attempting to associate with a network.
     * @type {Integer (Int32)}
     */
    static wlan_interface_state_associating => 5

    /**
     * Auto configuration is discovering the settings for the network.
     * @type {Integer (Int32)}
     */
    static wlan_interface_state_discovering => 6

    /**
     * The interface is in the process of authenticating.
     * @type {Integer (Int32)}
     */
    static wlan_interface_state_authenticating => 7
}
