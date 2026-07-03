#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_BSS_TYPE.ahk" { DOT11_BSS_TYPE }
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }

/**
 * Contains information about an available wireless network. (DOT11_NETWORK)
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-dot11_network
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_NETWORK {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-ssid">DOT11_SSID</a> structure that contains the SSID of a visible wireless network.
     */
    dot11Ssid : DOT11_SSID

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-bss-type">DOT11_BSS_TYPE</a> value that indicates the BSS type of the network.
     */
    dot11BssType : DOT11_BSS_TYPE

}
