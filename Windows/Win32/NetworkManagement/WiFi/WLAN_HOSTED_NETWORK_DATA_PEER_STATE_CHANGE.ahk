#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WLAN_HOSTED_NETWORK_PEER_AUTH_STATE.ahk" { WLAN_HOSTED_NETWORK_PEER_AUTH_STATE }
#Import ".\WLAN_HOSTED_NETWORK_REASON.ahk" { WLAN_HOSTED_NETWORK_REASON }
#Import ".\WLAN_HOSTED_NETWORK_PEER_STATE.ahk" { WLAN_HOSTED_NETWORK_PEER_STATE }

/**
 * Contains information about a network state change for a data peer on the wireless Hosted Network.
 * @remarks
 * The <b>WLAN_HOSTED_NETWORK_DATA_PEER_STATE_CHANGE</b> structure is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and  later.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_hosted_network_data_peer_state_change
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_HOSTED_NETWORK_DATA_PEER_STATE_CHANGE {
    #StructPack 4

    /**
     * The previous network state for a data peer on the wireless Hosted Network.
     */
    OldState : WLAN_HOSTED_NETWORK_PEER_STATE

    /**
     * The current network state for a data peer on the wireless Hosted Network.
     */
    NewState : WLAN_HOSTED_NETWORK_PEER_STATE

    /**
     * The reason for the network state change for the data peer.
     */
    PeerStateChangeReason : WLAN_HOSTED_NETWORK_REASON

}
