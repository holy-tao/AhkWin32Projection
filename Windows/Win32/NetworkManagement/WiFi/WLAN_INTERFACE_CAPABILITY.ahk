#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_PHY_TYPE.ahk" { DOT11_PHY_TYPE }
#Import ".\WLAN_INTERFACE_TYPE.ahk" { WLAN_INTERFACE_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information about the capabilities of an interface.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_interface_capability
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_INTERFACE_CAPABILITY {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_interface_type">WLAN_INTERFACE_TYPE</a> value that indicates the type of the interface.
     */
    interfaceType : WLAN_INTERFACE_TYPE

    /**
     * Indicates whether 802.11d is supported by the interface.  If <b>TRUE</b>, 802.11d is supported.
     */
    bDot11DSupported : BOOL

    /**
     * The maximum size of the SSID list supported by this interface.
     */
    dwMaxDesiredSsidListSize : UInt32

    /**
     * The maximum size of the basic service set (BSS) identifier list supported by this interface.
     */
    dwMaxDesiredBssidListSize : UInt32

    /**
     * Contains the number of supported PHY types.
     */
    dwNumberOfSupportedPhys : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-phy-type">DOT11_PHY_TYPE</a> values that specify the supported PHY types. WLAN_MAX_PHY_INDEX is set to 64.
     */
    dot11PhyTypes : DOT11_PHY_TYPE[64]

}
