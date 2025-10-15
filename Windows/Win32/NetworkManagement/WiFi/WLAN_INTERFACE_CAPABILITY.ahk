#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Contains information about the capabilities of an interface.
 * @see https://docs.microsoft.com/windows/win32/api//wlanapi/ns-wlanapi-wlan_interface_capability
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_INTERFACE_CAPABILITY extends Win32Struct
{
    static sizeof => 276

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_interface_type">WLAN_INTERFACE_TYPE</a> value that indicates the type of the interface.
     * @type {Integer}
     */
    interfaceType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Indicates whether 802.11d is supported by the interface.  If <b>TRUE</b>, 802.11d is supported.
     * @type {BOOL}
     */
    bDot11DSupported{
        get {
            if(!this.HasProp("__bDot11DSupported"))
                this.__bDot11DSupported := BOOL(this.ptr + 4)
            return this.__bDot11DSupported
        }
    }

    /**
     * The maximum size of the SSID list supported by this interface.
     * @type {Integer}
     */
    dwMaxDesiredSsidListSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The maximum size of the basic service set (BSS) identifier list supported by this interface.
     * @type {Integer}
     */
    dwMaxDesiredBssidListSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Contains the number of supported PHY types.
     * @type {Integer}
     */
    dwNumberOfSupportedPhys {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-phy-type">DOT11_PHY_TYPE</a> values that specify the supported PHY types. WLAN_MAX_PHY_INDEX is set to 64.
     * @type {Array<Int32>}
     */
    dot11PhyTypes{
        get {
            if(!this.HasProp("__dot11PhyTypesProxyArray"))
                this.__dot11PhyTypesProxyArray := Win32FixedArray(this.ptr + 20, 64, Primitive, "int")
            return this.__dot11PhyTypesProxyArray
        }
    }
}
