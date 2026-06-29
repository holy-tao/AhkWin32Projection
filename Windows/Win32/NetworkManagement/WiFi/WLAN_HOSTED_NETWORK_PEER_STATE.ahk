#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WLAN_HOSTED_NETWORK_PEER_AUTH_STATE.ahk" { WLAN_HOSTED_NETWORK_PEER_AUTH_STATE }

/**
 * Contains information about the peer state for a peer on the wireless Hosted Network.
 * @remarks
 * The <b>WLAN_HOSTED_NETWORK_PEER_STATE</b> structure is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and  later.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_hosted_network_peer_state
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_HOSTED_NETWORK_PEER_STATE {
    #StructPack 4

    /**
     * The MAC address of the peer being described.
     */
    PeerMacAddress : Int8[6]

    /**
     * The current authentication state of this peer.
     */
    PeerAuthState : WLAN_HOSTED_NETWORK_PEER_AUTH_STATE

}
