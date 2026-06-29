#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WLAN_RATE_SET.ahk" { WLAN_RATE_SET }
#Import ".\DOT11_PHY_TYPE.ahk" { DOT11_PHY_TYPE }
#Import ".\DOT11_BSS_TYPE.ahk" { DOT11_BSS_TYPE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }

/**
 * Contains information about a basic service set (BSS).
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetnetworkbsslist">WlanGetNetworkBssList</a> function retrieves the BSS list of the wireless network or networks on a given interface and returns this information in a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_bss_list">WLAN_BSS_LIST</a> structure that contains an array of .<b>WLAN_BSS_ENTRY</b> structures.  
 * 
 *  
 * 
 * When the wireless LAN interface is also operating as  a Wireless Hosted Network , the BSS list will contain an entry for the BSS created for the Wireless Hosted Network.
 * 
 * 
 * 
 * Since the information is returned by the access point for an infrastructure BSS network or by the network peer for an independent BSS network (ad hoc network), the information returned should not be trusted. The <b>ulIeOffset</b> and <b>ulIeSize</b>  members in the <b>WLAN_BSS_ENTRY</b> structure should be used to determine the maximum size of the information element data blob in the <b>WLAN_BSS_ENTRY</b> structure, not the data in the information element data blob.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_bss_entry
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_BSS_ENTRY {
    #StructPack 8

    /**
     * The SSID of the access point (AP) or peer station associated with the BSS. The data type for this member is a <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-ssid">DOT11_SSID</a> structure.
     */
    dot11Ssid : DOT11_SSID

    /**
     * The identifier (ID) of the PHY that the wireless LAN interface used to detect the BSS network.
     */
    uPhyId : UInt32

    /**
     * The media access control (MAC) address of the access point for infrastructure BSS networks or the peer station for independent BSS networks (ad hoc networks) that sent the 802.11 Beacon or Probe Response frame received by the wireless LAN interface while scanning. The data type for this member is a <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-mac-address-type">DOT11_MAC_ADDRESS</a> structure.
     */
    dot11Bssid : Int8[6]

    /**
     * The BSS network type. The data type for this member is a <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-bss-type">DOT11_BSS_TYPE</a> enumeration value.
     */
    dot11BssType : DOT11_BSS_TYPE

    /**
     * The PHY type for this network. The data type for this member is a <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-phy-type">DOT11_PHY_TYPE</a> enumeration value.
     */
    dot11BssPhyType : DOT11_PHY_TYPE

    /**
     * The received signal strength indicator (RSSI) value, in units of decibels referenced to 1.0 milliwatts (dBm), as detected by the wireless LAN interface driver for the AP or peer station.
     */
    lRssi : Int32

    /**
     * The link quality reported by the wireless LAN interface driver. The link quality value ranges from 0 through 100. A value of 100 specifies the highest link quality.
     */
    uLinkQuality : UInt32

    /**
     * A value that specifies whether the AP or peer station is operating within the regulatory domain as identified by the country/region.
     * 
     * If the wireless LAN interface driver does not support multiple regulatory domains, this member is set to <b>TRUE</b>.
     * 
     * If the 802.11 Beacon or Probe Response frame received from the AP or peer station does not include a Country information element (IE), this member is set to <b>TRUE</b>. 
     * 
     * If the 802.11 Beacon or Probe Response frame received from the AP or peer station does include a Country IE, this member is set to <b>FALSE</b> if the value of the Country String subfield does not equal the input country string.
     */
    bInRegDomain : BOOLEAN

    /**
     * The value of the Beacon Interval field from the 802.11 Beacon or Probe Response frame received by the wireless LAN interface.
     * 
     * The interval is in 1,024 microsecond time units between target beacon transmission
     * times. This information is retrieved from the beacon packet sent by an access point in an infrastructure BSS network or a probe response from an access point or peer station in response to a wireless LAN client sending a Probe Request.
     * 
     * The IEEE 802.11 standard defines a unit of time as equal to 1,024 microseconds.  This unit was defined so that it could be easily implemented in hardware.
     */
    usBeaconPeriod : UInt16

    /**
     * The value of the Timestamp field from the 802.11 Beacon or Probe Response frame received by the wireless LAN interface.
     */
    ullTimestamp : Int64

    /**
     * The host timestamp value that records when wireless LAN interface received the Beacon or Probe Response frame. This member is a count of 100-nanosecond intervals since January 1, 1601. 
     * 
     * For more information, see the <b>NdisGetCurrentSystemTime</b> function documented in the WDK.
     */
    ullHostTimestamp : Int64

    /**
     * The value of the Capability Information field from the 802.11 Beacon or Probe Response frame received by the wireless LAN interface. This value is  a set of bit flags defining the capability.
     */
    usCapabilityInformation : UInt16

    /**
     * The channel center frequency of the band on which the 802.11 Beacon or Probe Response frame was received. The value of <b>ulChCenterFrequency</b> is in units of kilohertz (kHz). 
     * 
     * <div class="alert"><b>Note</b>  This member is only valid for PHY types that are not frequency-hopping spread spectrum (FHSS).
     * </div>
     * <div> </div>
     */
    ulChCenterFrequency : UInt32

    /**
     * A set of data transfer rates supported by the BSS. The data type for this member is a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_rate_set">WLAN_RATE_SET</a> structure.
     */
    wlanRateSet : WLAN_RATE_SET

    /**
     * The offset, in bytes, of the information element (IE) data blob from the beginning of the <b>WLAN_BSS_ENTRY</b> structure.
     * 
     * This member points to a buffer that contains variable-length information elements (IEs) from the 802.11 Beacon or Probe Response frames. For each BSS, the IEs are from the last Beacon or Probe Response frame received from that BSS network. If an IE is available in only one frame, the wireless LAN interface driver merges the IE with the other IEs from the last received Beacon or Probe Response frame.
     * 
     * Information elements are defined in the IEEE 802.11 specifications to have a common general format consisting of a 1-byte Element ID field, a 1-byte Length field, and a variable-length element-specific information field. Each information element is assigned a unique
     * Element ID value as defined in this IEEE 802.11 standards. The Length field specifies the number of bytes in the information
     * field.
     */
    ulIeOffset : UInt32

    /**
     * The size, in bytes, of the IE data blob in the <b>WLAN_BSS_ENTRY</b> structure. 
     * 
     * This is the exact length of the data in the buffer pointed to by <b>ulIeOffset</b> member and does not contain any padding for alignment. The maximum value for the size of the IE data blob is 2,324 bytes.
     */
    ulIeSize : UInt32

}
