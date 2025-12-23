#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_SSID.ahk

/**
 * Contains association attributes for a connection.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_association_attributes
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_ASSOCIATION_ATTRIBUTES extends Win32Struct
{
    static sizeof => 68

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-ssid">DOT11_SSID</a> structure that contains the SSID of the association.
     * @type {DOT11_SSID}
     */
    dot11Ssid{
        get {
            if(!this.HasProp("__dot11Ssid"))
                this.__dot11Ssid := DOT11_SSID(0, this)
            return this.__dot11Ssid
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-bss-type">DOT11_BSS_TYPE</a> value that specifies whether the network is infrastructure or ad hoc.
     * @type {Integer}
     */
    dot11BssType {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-mac-address-type">DOT11_MAC_ADDRESS</a> that contains the BSSID of the association.
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
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-phy-type">DOT11_PHY_TYPE</a> value that indicates the physical type of the association.
     * @type {Integer}
     */
    dot11PhyType {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * The position of the <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-phy-type">DOT11_PHY_TYPE</a> value in the structure containing the list of PHY types.
     * @type {Integer}
     */
    uDot11PhyIndex {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * A percentage value that represents the signal quality of the network.  <b>WLAN_SIGNAL_QUALITY</b> is of type <b>ULONG</b>.  This member contains a value between 0 and 100. A value of 0 implies an actual RSSI signal strength of -100 dbm. A value of 100 implies an actual RSSI signal strength of -50 dbm. You can calculate the RSSI signal strength value for <b>wlanSignalQuality</b> values between 1 and 99 using linear interpolation.
     * @type {Integer}
     */
    wlanSignalQuality {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Contains the receiving rate of the association.
     * @type {Integer}
     */
    ulRxRate {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Contains the transmission rate of the association.
     * @type {Integer}
     */
    ulTxRate {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
