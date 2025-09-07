#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WLAN_HOSTED_NETWORK_PEER_STATE.ahk

/**
 * Contains information about the status of the wireless Hosted Network.
 * @remarks
 * The <b>WLAN_HOSTED_NETWORK_STATUS</b>  structure is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and  later.  
  * 
  * The <b>WLAN_HOSTED_NETWORK_STATUS</b>  structure  is returned in a pointer in the <i>ppWlanHostedNetworkStatus</i> parameter by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanhostednetworkquerystatus">WlanHostedNetworkQueryStatus</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_hosted_network_status
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_HOSTED_NETWORK_STATUS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The current state of the wireless Hosted Network.
     * 
     * If the value of this member is <b>wlan_hosted_network_unavailable</b>, then the values of the other fields in this structure should not be used.
     * @type {Integer}
     */
    HostedNetworkState {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The actual network Device ID used for  the wireless Hosted Network. 
     * 
     * This is member is the GUID of a virtual wireless device which would not be available through calls to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function. This GUID can be used for calling other higher layer networking functions that use the device GUID (IP Helper functions, for example).
     * @type {Pointer<Guid>}
     */
    IPDeviceID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The BSSID used by the wireless Hosted Network in packets, beacons, and probe responses.
     * @type {Array<Byte>}
     */
    wlanHostedNetworkBSSID{
        get {
            if(!this.HasProp("__wlanHostedNetworkBSSIDProxyArray"))
                this.__wlanHostedNetworkBSSIDProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__wlanHostedNetworkBSSIDProxyArray
        }
    }

    /**
     * The physical type of the network interface used by wireless Hosted Network.
     * 
     * This is one of the types  reported by the related physical interface. This value is correct only if the <b>HostedNetworkState</b> member is <b>wlan_hosted_network_active</b>.
     * @type {Integer}
     */
    dot11PhyType {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * The channel frequency of the network interface used by wireless Hosted Network.
     * 
     *  This value is correct only if <b>HostedNetworkState</b> is <b>wlan_hosted_network_active</b>.
     * @type {Integer}
     */
    ulChannelFrequency {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The current number of authenticated peers on the wireless Hosted Network.
     * 
     *  This value is correct only if <b>HostedNetworkState</b> is <b>wlan_hosted_network_active</b>.
     * @type {Integer}
     */
    dwNumberOfPeers {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_hosted_network_peer_state">WLAN_HOSTED_NETWORK_PEER_STATE</a>  structures describing each of the current peers on the wireless Hosted Network. The number of elements in the array is given by <b>dwNumberOfPeers</b> member.
     * 
     *  This value is correct only if <b>HostedNetworkState</b> is <b>wlan_hosted_network_active</b>.
     * @type {Array<WLAN_HOSTED_NETWORK_PEER_STATE>}
     */
    PeerList{
        get {
            if(!this.HasProp("__PeerListProxyArray"))
                this.__PeerListProxyArray := Win32FixedArray(this.ptr + 40, 8, WLAN_HOSTED_NETWORK_PEER_STATE, "")
            return this.__PeerListProxyArray
        }
    }
}
