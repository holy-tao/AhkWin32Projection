#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }

/**
 * Contains information about the connection settings on the wireless Hosted Network.
 * @remarks
 * The <b>WLAN_HOSTED_NETWORK_CONNECTION_SETTINGS</b> structure is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and  later.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_hosted_network_connection_settings
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_HOSTED_NETWORK_CONNECTION_SETTINGS {
    #StructPack 4

    /**
     * The SSID associated with the wireless Hosted Network.
     */
    hostedNetworkSSID : DOT11_SSID

    /**
     * The maximum number of concurrent peers allowed by the wireless Hosted Network.
     */
    dwMaxNumberOfPeers : UInt32

}
