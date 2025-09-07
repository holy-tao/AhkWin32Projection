#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_SSID.ahk

/**
 * Contains information about an available wireless network. (WLAN_AVAILABLE_NETWORK)
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_available_network
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_AVAILABLE_NETWORK extends Win32Struct
{
    static sizeof => 632

    static packingSize => 8

    /**
     * Contains the profile name associated with the network.  If the network does not have a profile, this member will be empty.  If multiple profiles are associated with the network, there will be multiple entries with the same SSID in the visible network list. Profile names are case-sensitive. This string must be NULL-terminated.
     * @type {String}
     */
    strProfileName {
        get => StrGet(this.ptr + 0, 255, "UTF-16")
        set => StrPut(value, this.ptr + 0, 255, "UTF-16")
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-ssid">DOT11_SSID</a> structure that contains the SSID of the visible wireless network.
     * @type {DOT11_SSID}
     */
    dot11Ssid{
        get {
            if(!this.HasProp("__dot11Ssid"))
                this.__dot11Ssid := DOT11_SSID(this.ptr + 512)
            return this.__dot11Ssid
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-bss-type">DOT11_BSS_TYPE</a> value that specifies whether the network is infrastructure or ad hoc.
     * @type {Integer}
     */
    dot11BssType {
        get => NumGet(this, 548, "int")
        set => NumPut("int", value, this, 548)
    }

    /**
     * Indicates the number of BSSIDs in the network.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b><b>uNumberofBssids</b> is at most 1, regardless of the number of access points broadcasting the SSID.
     * @type {Integer}
     */
    uNumberOfBssids {
        get => NumGet(this, 552, "uint")
        set => NumPut("uint", value, this, 552)
    }

    /**
     * Indicates whether the network is connectable or not.    If set to <b>TRUE</b>, the network is connectable, otherwise the network cannot be connected to.
     * @type {Integer}
     */
    bNetworkConnectable {
        get => NumGet(this, 556, "int")
        set => NumPut("int", value, this, 556)
    }

    /**
     * A WLAN_REASON_CODE value that indicates why a network cannot be connected to.  This member is only valid when  <b>bNetworkConnectable</b> is <b>FALSE</b>.
     * @type {Integer}
     */
    wlanNotConnectableReason {
        get => NumGet(this, 560, "uint")
        set => NumPut("uint", value, this, 560)
    }

    /**
     * The number of PHY types supported on available networks. The maximum value of <i>uNumberOfPhyTypes</i> is <b>WLAN_MAX_PHY_TYPE_NUMBER</b>, which has a value of 8. If more than <b>WLAN_MAX_PHY_TYPE_NUMBER</b> PHY types are supported, <i>bMorePhyTypes</i> must be set to <b>TRUE</b>.
     * @type {Integer}
     */
    uNumberOfPhyTypes {
        get => NumGet(this, 564, "uint")
        set => NumPut("uint", value, this, 564)
    }

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-phy-type">DOT11_PHY_TYPE</a> values that represent the PHY types supported by the available networks. When <i>uNumberOfPhyTypes</i> is greater than <b>WLAN_MAX_PHY_TYPE_NUMBER</b>, this array contains only the first <b>WLAN_MAX_PHY_TYPE_NUMBER</b> PHY types.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dot11_phy_type_unknown"></a><a id="DOT11_PHY_TYPE_UNKNOWN"></a><dl>
     * <dt><b>dot11_phy_type_unknown</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies an unknown or uninitialized PHY type. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dot11_phy_type_any"></a><a id="DOT11_PHY_TYPE_ANY"></a><dl>
     * <dt><b>dot11_phy_type_any</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies any PHY type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dot11_phy_type_fhss"></a><a id="DOT11_PHY_TYPE_FHSS"></a><dl>
     * <dt><b>dot11_phy_type_fhss</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies a frequency-hopping spread-spectrum (FHSS) PHY. Bluetooth devices can use FHSS or an adaptation of FHSS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dot11_phy_type_dsss"></a><a id="DOT11_PHY_TYPE_DSSS"></a><dl>
     * <dt><b>dot11_phy_type_dsss</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies a direct sequence spread spectrum (DSSS) PHY. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dot11_phy_type_irbaseband"></a><a id="DOT11_PHY_TYPE_IRBASEBAND"></a><dl>
     * <dt><b>dot11_phy_type_irbaseband</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies an infrared (IR) baseband PHY. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dot11_phy_type_ofdm"></a><a id="DOT11_PHY_TYPE_OFDM"></a><dl>
     * <dt><b>dot11_phy_type_ofdm</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies an orthogonal frequency division multiplexing (OFDM) PHY.  802.11a devices can use OFDM.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dot11_phy_type_hrdsss"></a><a id="DOT11_PHY_TYPE_HRDSSS"></a><dl>
     * <dt><b>dot11_phy_type_hrdsss</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies a high-rate DSSS (HRDSSS) PHY.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dot11_phy_type_erp"></a><a id="DOT11_PHY_TYPE_ERP"></a><dl>
     * <dt><b>dot11_phy_type_erp</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies an extended rate PHY (ERP). 802.11g devices can use ERP.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dot11_phy_type_ht"></a><a id="DOT11_PHY_TYPE_HT"></a><dl>
     * <dt><b>dot11_phy_type_ht</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies an 802.11n PHY type.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dot11_phy_type_vht"></a><a id="DOT11_PHY_TYPE_VHT"></a><dl>
     * <dt><b>dot11_phy_type_vht</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies the 802.11ac PHY type. This is the very high throughput PHY type specified in IEEE 802.11ac.
     * 
     * This value is supported on Windows 8.1, Windows Server 2012 R2, and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dot11_phy_type_IHV_start"></a><a id="dot11_phy_type_ihv_start"></a><a id="DOT11_PHY_TYPE_IHV_START"></a><dl>
     * <dt><b>dot11_phy_type_IHV_start</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies the start of the range that is used to define PHY types that are developed by an independent hardware vendor (IHV).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dot11_phy_type_IHV_end"></a><a id="dot11_phy_type_ihv_end"></a><a id="DOT11_PHY_TYPE_IHV_END"></a><dl>
     * <dt><b>dot11_phy_type_IHV_end</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies the end of the range that is used to define PHY types that are developed by an independent hardware vendor (IHV).
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Array<Int32>}
     */
    dot11PhyTypes{
        get {
            if(!this.HasProp("__dot11PhyTypesProxyArray"))
                this.__dot11PhyTypesProxyArray := Win32FixedArray(this.ptr + 568, 4, Primitive, "int")
            return this.__dot11PhyTypesProxyArray
        }
    }

    /**
     * Specifies if there are more than <b>WLAN_MAX_PHY_TYPE_NUMBER</b> PHY types supported. 
     * 
     * When this member is set to <b>TRUE</b>, an application must call <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetnetworkbsslist">WlanGetNetworkBssList</a> to get the complete list of PHY types. The returned  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_bss_list">WLAN_BSS_LIST</a> structure has an array of <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_bss_entry">WLAN_BSS_ENTRY</a> structures. The <i>uPhyId</i> member of the <b>WLAN_BSS_ENTRY</b>   structure contains the PHY type for an entry.
     * @type {Integer}
     */
    bMorePhyTypes {
        get => NumGet(this, 600, "int")
        set => NumPut("int", value, this, 600)
    }

    /**
     * A percentage value that represents the signal quality of the network.  <b>WLAN_SIGNAL_QUALITY</b> is of type <b>ULONG</b>.  This member contains a value between 0 and 100. A value of 0 implies an actual RSSI signal strength of -100 dbm. A value of 100 implies an actual RSSI signal strength of -50 dbm. You can calculate the RSSI signal strength value for <b>wlanSignalQuality</b> values between 1 and 99 using linear interpolation.
     * @type {Integer}
     */
    wlanSignalQuality {
        get => NumGet(this, 604, "uint")
        set => NumPut("uint", value, this, 604)
    }

    /**
     * Indicates whether security is enabled on the network.  A value of <b>TRUE</b> indicates that security is enabled, otherwise it is not.
     * @type {Integer}
     */
    bSecurityEnabled {
        get => NumGet(this, 608, "int")
        set => NumPut("int", value, this, 608)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-auth-algorithm">DOT11_AUTH_ALGORITHM</a> value that indicates the default authentication algorithm used to join this network for the first time.
     * @type {Integer}
     */
    dot11DefaultAuthAlgorithm {
        get => NumGet(this, 612, "int")
        set => NumPut("int", value, this, 612)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-cipher-algorithm">DOT11_CIPHER_ALGORITHM</a> value that indicates the default cipher algorithm to be used when joining this network.
     * @type {Integer}
     */
    dot11DefaultCipherAlgorithm {
        get => NumGet(this, 616, "int")
        set => NumPut("int", value, this, 616)
    }

    /**
     * Contains various flags for the network.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLAN_AVAILABLE_NETWORK_CONNECTED"></a><a id="wlan_available_network_connected"></a><dl>
     * <dt><b>WLAN_AVAILABLE_NETWORK_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This network is currently connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLAN_AVAILABLE_NETWORK_HAS_PROFILE"></a><a id="wlan_available_network_has_profile"></a><dl>
     * <dt><b>WLAN_AVAILABLE_NETWORK_HAS_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is a profile for this network.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 620, "uint")
        set => NumPut("uint", value, this, 620)
    }

    /**
     * Reserved for future use.  Must be set to <b>NULL</b>.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 624, "uint")
        set => NumPut("uint", value, this, 624)
    }
}
