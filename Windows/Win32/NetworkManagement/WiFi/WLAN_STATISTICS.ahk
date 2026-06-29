#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WLAN_MAC_FRAME_STATISTICS.ahk" { WLAN_MAC_FRAME_STATISTICS }
#Import ".\WLAN_PHY_FRAME_STATISTICS.ahk" { WLAN_PHY_FRAME_STATISTICS }

/**
 * Assorted statistics about an interface.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_statistics
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_STATISTICS {
    #StructPack 8

    /**
     * Indicates the number of 4-way handshake failures.  This member is only valid if IHV Service is being used as the authentication service for the current network.
     */
    ullFourWayHandshakeFailures : Int64

    /**
     * Indicates the number of TKIP countermeasures performed by an IHV Miniport driver.  This count does not include TKIP countermeasures invoked by the operating system.
     */
    ullTKIPCounterMeasuresInvoked : Int64

    /**
     * Reserved for use by Microsoft.
     */
    ullReserved : Int64

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_mac_frame_statistics">WLAN_MAC_FRAME_STATISTICS</a> structure that contains MAC layer counters for unicast packets directed to the receiver of the NIC.
     */
    MacUcastCounters : WLAN_MAC_FRAME_STATISTICS

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_mac_frame_statistics">WLAN_MAC_FRAME_STATISTICS</a> structure that contains MAC layer counters for multicast packets directed to the current multicast address.
     */
    MacMcastCounters : WLAN_MAC_FRAME_STATISTICS

    /**
     * Contains the number of <b>WLAN_PHY_FRAME_STATISTICS</b> structures in the <b>PhyCounters</b> member.
     */
    dwNumberOfPhys : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_phy_frame_statistics">WLAN_PHY_FRAME_STATISTICS</a> structures that contain PHY layer counters.
     */
    PhyCounters : WLAN_PHY_FRAME_STATISTICS[1]

}
