#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_SSID.ahk

/**
 * Contains information about the connection settings on the wireless Hosted Network.
 * @remarks
 * The <b>WLAN_HOSTED_NETWORK_CONNECTION_SETTINGS</b> structure is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and  later.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_hosted_network_connection_settings
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_HOSTED_NETWORK_CONNECTION_SETTINGS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The SSID associated with the wireless Hosted Network.
     * @type {DOT11_SSID}
     */
    hostedNetworkSSID{
        get {
            if(!this.HasProp("__hostedNetworkSSID"))
                this.__hostedNetworkSSID := DOT11_SSID(0, this)
            return this.__hostedNetworkSSID
        }
    }

    /**
     * The maximum number of concurrent peers allowed by the wireless Hosted Network.
     * @type {Integer}
     */
    dwMaxNumberOfPeers {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
