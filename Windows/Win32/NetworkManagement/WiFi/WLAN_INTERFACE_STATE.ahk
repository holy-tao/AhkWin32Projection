#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WLAN_INTERFACE_STATE enumeration indicates the state of an interface.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_interface_state~r1
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class WLAN_INTERFACE_STATE extends Win32Enum {

    /**
     * The interface is not ready to operate.
     * Native name: wlan_interface_state_not_ready
     * @type {Integer (Int32)}
     */
    static not_ready => 0

    /**
     * The interface is connected to a network.
     * Native name: wlan_interface_state_connected
     * @type {Integer (Int32)}
     */
    static connected => 1

    /**
     * The interface is the first node in an ad hoc network.  No peer has connected.
     * Native name: wlan_interface_state_ad_hoc_network_formed
     * @type {Integer (Int32)}
     */
    static ad_hoc_network_formed => 2

    /**
     * The interface is disconnecting from the current network.
     * Native name: wlan_interface_state_disconnecting
     * @type {Integer (Int32)}
     */
    static disconnecting => 3

    /**
     * The interface is not connected to any network.
     * Native name: wlan_interface_state_disconnected
     * @type {Integer (Int32)}
     */
    static disconnected => 4

    /**
     * The interface is attempting to associate with a network.
     * Native name: wlan_interface_state_associating
     * @type {Integer (Int32)}
     */
    static associating => 5

    /**
     * Auto configuration is discovering the settings for the network.
     * Native name: wlan_interface_state_discovering
     * @type {Integer (Int32)}
     */
    static discovering => 6

    /**
     * The interface is in the process of authenticating.
     * Native name: wlan_interface_state_authenticating
     * @type {Integer (Int32)}
     */
    static authenticating => 7
}
