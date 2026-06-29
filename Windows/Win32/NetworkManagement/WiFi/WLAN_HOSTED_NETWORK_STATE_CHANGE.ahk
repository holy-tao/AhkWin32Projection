#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WLAN_HOSTED_NETWORK_STATE.ahk" { WLAN_HOSTED_NETWORK_STATE }
#Import ".\WLAN_HOSTED_NETWORK_REASON.ahk" { WLAN_HOSTED_NETWORK_REASON }

/**
 * Contains information about a network state change on the wireless Hosted Network.
 * @remarks
 * The <b>WLAN_HOSTED_NETWORK_STATE_CHANGE</b> structure is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and  later.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_hosted_network_state_change
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_HOSTED_NETWORK_STATE_CHANGE {
    #StructPack 4

    /**
     * The previous network state on the wireless Hosted Network.
     */
    OldState : WLAN_HOSTED_NETWORK_STATE

    /**
     * The current network state on the wireless Hosted Network.
     */
    NewState : WLAN_HOSTED_NETWORK_STATE

    /**
     * The reason for the network state change.
     */
    StateChangeReason : WLAN_HOSTED_NETWORK_REASON

}
