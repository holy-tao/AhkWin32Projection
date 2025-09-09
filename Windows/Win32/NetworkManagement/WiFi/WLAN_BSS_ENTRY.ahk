#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_SSID.ahk
#Include .\WLAN_RATE_SET.ahk

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
 * @version v4.0.30319
 */
class WLAN_BSS_ENTRY extends Win32Struct
{
    static sizeof => 360

    static packingSize => 8

    /**
     * The SSID of the access point (AP) or peer station associated with the BSS. The data type for this member is a <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-ssid">DOT11_SSID</a> structure.
     * @type {DOT11_SSID}
     */
    dot11Ssid{
        get {
            if(!this.HasProp("__dot11Ssid"))
                this.__dot11Ssid := DOT11_SSID(this.ptr + 0)
            return this.__dot11Ssid
        }
    }

    /**
     * The identifier (ID) of the PHY that the wireless LAN interface used to detect the BSS network.
     * @type {Integer}
     */
    uPhyId {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The media access control (MAC) address of the access point for infrastructure BSS networks or the peer station for independent BSS networks (ad hoc networks) that sent the 802.11 Beacon or Probe Response frame received by the wireless LAN interface while scanning. The data type for this member is a <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-mac-address-type">DOT11_MAC_ADDRESS</a> structure.
     * @type {Array<Byte>}
     */
    dot11Bssid{
        get {
            if(!this.HasProp("__dot11BssidProxyArray"))
                this.__dot11BssidProxyArray := Win32FixedArray(this.ptr + 40, 6, Primitive, "char")
            return this.__dot11BssidProxyArray
        }
    }

    /**
     * The BSS network type. The data type for this member is a <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-bss-type">DOT11_BSS_TYPE</a> enumeration value.
     * @type {Integer}
     */
    dot11BssType {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * The PHY type for this network. The data type for this member is a <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-phy-type">DOT11_PHY_TYPE</a> enumeration value.
     * @type {Integer}
     */
    dot11BssPhyType {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * The received signal strength indicator (RSSI) value, in units of decibels referenced to 1.0 milliwatts (dBm), as detected by the wireless LAN interface driver for the AP or peer station.
     * @type {Integer}
     */
    lRssi {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * The link quality reported by the wireless LAN interface driver. The link quality value ranges from 0 through 100. A value of 100 specifies the highest link quality.
     * @type {Integer}
     */
    uLinkQuality {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * A value that specifies whether the AP or peer station is operating within the regulatory domain as identified by the country/region.
     * 
     * If the wireless LAN interface driver does not support multiple regulatory domains, this member is set to <b>TRUE</b>.
     * 
     * If the 802.11 Beacon or Probe Response frame received from the AP or peer station does not include a Country information element (IE), this member is set to <b>TRUE</b>. 
     * 
     * If the 802.11 Beacon or Probe Response frame received from the AP or peer station does include a Country IE, this member is set to <b>FALSE</b> if the value of the Country String subfield does not equal the input country string.
     * @type {Integer}
     */
    bInRegDomain {
        get => NumGet(this, 64, "char")
        set => NumPut("char", value, this, 64)
    }

    /**
     * The value of the Beacon Interval field from the 802.11 Beacon or Probe Response frame received by the wireless LAN interface.
     * 
     * The interval is in 1,024 microsecond time units between target beacon transmission
     * times. This information is retrieved from the beacon packet sent by an access point in an infrastructure BSS network or a probe response from an access point or peer station in response to a wireless LAN client sending a Probe Request.
     * 
     * The IEEE 802.11 standard defines a unit of time as equal to 1,024 microseconds.  This unit was defined so that it could be easily implemented in hardware.
     * @type {Integer}
     */
    usBeaconPeriod {
        get => NumGet(this, 66, "ushort")
        set => NumPut("ushort", value, this, 66)
    }

    /**
     * The value of the Timestamp field from the 802.11 Beacon or Probe Response frame received by the wireless LAN interface.
     * @type {Integer}
     */
    ullTimestamp {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * The host timestamp value that records when wireless LAN interface received the Beacon or Probe Response frame. This member is a count of 100-nanosecond intervals since January 1, 1601. 
     * 
     * For more information, see the <b>NdisGetCurrentSystemTime</b> function documented in the WDK.
     * @type {Integer}
     */
    ullHostTimestamp {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * The value of the Capability Information field from the 802.11 Beacon or Probe Response frame received by the wireless LAN interface. This value is  a set of bit flags defining the capability.
     * @type {Integer}
     */
    usCapabilityInformation {
        get => NumGet(this, 88, "ushort")
        set => NumPut("ushort", value, this, 88)
    }

    /**
     * The channel center frequency of the band on which the 802.11 Beacon or Probe Response frame was received. The value of <b>ulChCenterFrequency</b> is in units of kilohertz (kHz). 
     * 
     * <div class="alert"><b>Note</b>  This member is only valid for PHY types that are not frequency-hopping spread spectrum (FHSS).
     * </div>
     * <div> </div>
     * @type {Integer}
     */
    ulChCenterFrequency {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * A set of data transfer rates supported by the BSS. The data type for this member is a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_rate_set">WLAN_RATE_SET</a> structure.
     * @type {WLAN_RATE_SET}
     */
    wlanRateSet{
        get {
            if(!this.HasProp("__wlanRateSet"))
                this.__wlanRateSet := WLAN_RATE_SET(this.ptr + 96)
            return this.__wlanRateSet
        }
    }

    /**
     * The offset, in bytes, of the information element (IE) data blob from the beginning of the <b>WLAN_BSS_ENTRY</b> structure.
     * 
     * This member points to a buffer that contains variable-length information elements (IEs) from the 802.11 Beacon or Probe Response frames. For each BSS, the IEs are from the last Beacon or Probe Response frame received from that BSS network. If an IE is available in only one frame, the wireless LAN interface driver merges the IE with the other IEs from the last received Beacon or Probe Response frame.
     * 
     * Information elements are defined in the IEEE 802.11 specifications to have a common general format consisting of a 1-byte Element ID field, a 1-byte Length field, and a variable-length element-specific information field. Each information element is assigned a unique
     * Element ID value as defined in this IEEE 802.11 standards. The Length field specifies the number of bytes in the information
     * field.
     * @type {Integer}
     */
    ulIeOffset {
        get => NumGet(this, 352, "uint")
        set => NumPut("uint", value, this, 352)
    }

    /**
     * The size, in bytes, of the IE data blob in the <b>WLAN_BSS_ENTRY</b> structure. 
     * 
     * This is the exact length of the data in the buffer pointed to by <b>ulIeOffset</b> member and does not contain any padding for alignment. The maximum value for the size of the IE data blob is 2,324 bytes.
     * @type {Integer}
     */
    ulIeSize {
        get => NumGet(this, 356, "uint")
        set => NumPut("uint", value, this, 356)
    }
}
