#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WLAN_MAC_FRAME_STATISTICS.ahk
#Include .\WLAN_PHY_FRAME_STATISTICS.ahk

/**
 * Assorted statistics about an interface.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_statistics
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_STATISTICS extends Win32Struct
{
    static sizeof => 232

    static packingSize => 8

    /**
     * Indicates the number of 4-way handshake failures.  This member is only valid if IHV Service is being used as the authentication service for the current network.
     * @type {Integer}
     */
    ullFourWayHandshakeFailures {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates the number of TKIP countermeasures performed by an IHV Miniport driver.  This count does not include TKIP countermeasures invoked by the operating system.
     * @type {Integer}
     */
    ullTKIPCounterMeasuresInvoked {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Reserved for use by Microsoft.
     * @type {Integer}
     */
    ullReserved {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_mac_frame_statistics">WLAN_MAC_FRAME_STATISTICS</a> structure that contains MAC layer counters for unicast packets directed to the receiver of the NIC.
     * @type {WLAN_MAC_FRAME_STATISTICS}
     */
    MacUcastCounters{
        get {
            if(!this.HasProp("__MacUcastCounters"))
                this.__MacUcastCounters := WLAN_MAC_FRAME_STATISTICS(this.ptr + 24)
            return this.__MacUcastCounters
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_mac_frame_statistics">WLAN_MAC_FRAME_STATISTICS</a> structure that contains MAC layer counters for multicast packets directed to the current multicast address.
     * @type {WLAN_MAC_FRAME_STATISTICS}
     */
    MacMcastCounters{
        get {
            if(!this.HasProp("__MacMcastCounters"))
                this.__MacMcastCounters := WLAN_MAC_FRAME_STATISTICS(this.ptr + 120)
            return this.__MacMcastCounters
        }
    }

    /**
     * Contains the number of <b>WLAN_PHY_FRAME_STATISTICS</b> structures in the <b>PhyCounters</b> member.
     * @type {Integer}
     */
    dwNumberOfPhys {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_phy_frame_statistics">WLAN_PHY_FRAME_STATISTICS</a> structures that contain PHY layer counters.
     * @type {Array<WLAN_PHY_FRAME_STATISTICS>}
     */
    PhyCounters{
        get {
            if(!this.HasProp("__PhyCountersProxyArray"))
                this.__PhyCountersProxyArray := Win32FixedArray(this.ptr + 224, 8, WLAN_PHY_FRAME_STATISTICS, "")
            return this.__PhyCountersProxyArray
        }
    }
}
