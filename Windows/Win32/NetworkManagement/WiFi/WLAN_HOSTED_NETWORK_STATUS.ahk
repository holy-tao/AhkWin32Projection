#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WLAN_HOSTED_NETWORK_PEER_AUTH_STATE.ahk" { WLAN_HOSTED_NETWORK_PEER_AUTH_STATE }
#Import ".\WLAN_HOSTED_NETWORK_STATE.ahk" { WLAN_HOSTED_NETWORK_STATE }
#Import ".\DOT11_PHY_TYPE.ahk" { DOT11_PHY_TYPE }
#Import ".\WLAN_HOSTED_NETWORK_PEER_STATE.ahk" { WLAN_HOSTED_NETWORK_PEER_STATE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains information about the status of the wireless Hosted Network.
 * @remarks
 * The <b>WLAN_HOSTED_NETWORK_STATUS</b>  structure is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and  later.  
 * 
 * The <b>WLAN_HOSTED_NETWORK_STATUS</b>  structure  is returned in a pointer in the <i>ppWlanHostedNetworkStatus</i> parameter by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanhostednetworkquerystatus">WlanHostedNetworkQueryStatus</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_hosted_network_status
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_HOSTED_NETWORK_STATUS {
    #StructPack 4

    /**
     * The current state of the wireless Hosted Network.
     * 
     * If the value of this member is <b>wlan_hosted_network_unavailable</b>, then the values of the other fields in this structure should not be used.
     */
    HostedNetworkState : WLAN_HOSTED_NETWORK_STATE

    /**
     * The actual network Device ID used for  the wireless Hosted Network. 
     * 
     * This is member is the GUID of a virtual wireless device which would not be available through calls to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function. This GUID can be used for calling other higher layer networking functions that use the device GUID (IP Helper functions, for example).
     */
    IPDeviceID : Guid

    /**
     * The BSSID used by the wireless Hosted Network in packets, beacons, and probe responses.
     */
    wlanHostedNetworkBSSID : Int8[6]

    /**
     * The physical type of the network interface used by wireless Hosted Network.
     * 
     * This is one of the types  reported by the related physical interface. This value is correct only if the <b>HostedNetworkState</b> member is <b>wlan_hosted_network_active</b>.
     */
    dot11PhyType : DOT11_PHY_TYPE

    /**
     * The channel frequency of the network interface used by wireless Hosted Network.
     * 
     *  This value is correct only if <b>HostedNetworkState</b> is <b>wlan_hosted_network_active</b>.
     */
    ulChannelFrequency : UInt32

    /**
     * The current number of authenticated peers on the wireless Hosted Network.
     * 
     *  This value is correct only if <b>HostedNetworkState</b> is <b>wlan_hosted_network_active</b>.
     */
    dwNumberOfPeers : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_hosted_network_peer_state">WLAN_HOSTED_NETWORK_PEER_STATE</a>  structures describing each of the current peers on the wireless Hosted Network. The number of elements in the array is given by <b>dwNumberOfPeers</b> member.
     * 
     *  This value is correct only if <b>HostedNetworkState</b> is <b>wlan_hosted_network_active</b>.
     */
    PeerList : WLAN_HOSTED_NETWORK_PEER_STATE[1]

}
