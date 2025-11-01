#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_adhoc_network_state~r1
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_ADHOC_NETWORK_STATE{

    /**
     * @type {Integer (Int32)}
     */
    static wlan_adhoc_network_state_formed => 0

    /**
     * @type {Integer (Int32)}
     */
    static wlan_adhoc_network_state_connected => 1
}
