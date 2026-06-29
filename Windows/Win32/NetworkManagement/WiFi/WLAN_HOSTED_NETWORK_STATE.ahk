#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the possible values for the network state of the wireless Hosted Network.
 * @remarks
 * The <b>WLAN_HOSTED_NETWORK_STATE</b> enumerated type is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and  later.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_hosted_network_state
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_HOSTED_NETWORK_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The wireless Hosted Network is unavailable.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_unavailable => 0

    /**
     * The wireless Hosted Network is idle.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_idle => 1

    /**
     * The wireless Hosted Network is active.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_active => 2
}
