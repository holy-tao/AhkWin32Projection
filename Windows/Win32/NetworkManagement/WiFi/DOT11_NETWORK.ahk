#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_SSID.ahk

/**
 * Contains information about an available wireless network. (DOT11_NETWORK)
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-dot11_network
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_NETWORK extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-ssid">DOT11_SSID</a> structure that contains the SSID of a visible wireless network.
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
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-bss-type">DOT11_BSS_TYPE</a> value that indicates the BSS type of the network.
     * @type {Integer}
     */
    dot11BssType {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }
}
