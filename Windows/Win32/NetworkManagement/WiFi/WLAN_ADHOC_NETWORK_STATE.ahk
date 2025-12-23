#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WLAN_ADHOC_NETWORK_STATE enumeration specifies the connection state of an ad hoc network.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_adhoc_network_state~r1
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_ADHOC_NETWORK_STATE extends Win32Enum{

    /**
     * The ad hoc network has been formed, but no client or host is connected to the network.
     * @type {Integer (Int32)}
     */
    static wlan_adhoc_network_state_formed => 0

    /**
     * A client or host is connected to the ad hoc network.
     * @type {Integer (Int32)}
     */
    static wlan_adhoc_network_state_connected => 1
}
