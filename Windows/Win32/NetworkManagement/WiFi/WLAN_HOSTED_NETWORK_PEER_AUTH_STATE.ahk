#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the possible values for the authentication state of a peer on the wireless Hosted Network.
 * @remarks
 * The <b>WLAN_HOSTED_NETWORK_PEER_AUTH_STATE</b> enumerated type is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and  later.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_hosted_network_peer_auth_state
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_HOSTED_NETWORK_PEER_AUTH_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * An invalid peer state.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_peer_state_invalid => 0

    /**
     * The peer is authenticated.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_peer_state_authenticated => 1
}
