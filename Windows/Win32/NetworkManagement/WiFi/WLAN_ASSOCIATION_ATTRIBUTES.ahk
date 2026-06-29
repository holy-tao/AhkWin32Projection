#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_PHY_TYPE.ahk" { DOT11_PHY_TYPE }
#Import ".\DOT11_BSS_TYPE.ahk" { DOT11_BSS_TYPE }
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }

/**
 * Contains association attributes for a connection.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_association_attributes
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_ASSOCIATION_ATTRIBUTES {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-ssid">DOT11_SSID</a> structure that contains the SSID of the association.
     */
    dot11Ssid : DOT11_SSID

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-bss-type">DOT11_BSS_TYPE</a> value that specifies whether the network is infrastructure or ad hoc.
     */
    dot11BssType : DOT11_BSS_TYPE

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-mac-address-type">DOT11_MAC_ADDRESS</a> that contains the BSSID of the association.
     */
    dot11Bssid : Int8[6]

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-phy-type">DOT11_PHY_TYPE</a> value that indicates the physical type of the association.
     */
    dot11PhyType : DOT11_PHY_TYPE

    /**
     * The position of the <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-phy-type">DOT11_PHY_TYPE</a> value in the structure containing the list of PHY types.
     */
    uDot11PhyIndex : UInt32

    /**
     * A percentage value that represents the signal quality of the network.  <b>WLAN_SIGNAL_QUALITY</b> is of type <b>ULONG</b>.  This member contains a value between 0 and 100. A value of 0 implies an actual RSSI signal strength of -100 dbm. A value of 100 implies an actual RSSI signal strength of -50 dbm. You can calculate the RSSI signal strength value for <b>wlanSignalQuality</b> values between 1 and 99 using linear interpolation.
     */
    wlanSignalQuality : UInt32

    /**
     * Contains the receiving rate of the association.
     */
    ulRxRate : UInt32

    /**
     * Contains the transmission rate of the association.
     */
    ulTxRate : UInt32

}
