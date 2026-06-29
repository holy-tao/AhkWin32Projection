#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WLAN_ADHOC_NETWORK_STATE enumeration specifies the connection state of an ad hoc network.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_adhoc_network_state~r1
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_ADHOC_NETWORK_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
