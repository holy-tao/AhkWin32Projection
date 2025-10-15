#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_SSID.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\DOT11_ACCESSNETWORKOPTIONS.ahk
#Include .\DOT11_VENUEINFO.ahk
#Include .\WLAN_AVAILABLE_NETWORK_V2.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_AVAILABLE_NETWORK_LIST_V2 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwNumberOfItems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<WLAN_AVAILABLE_NETWORK_V2>}
     */
    Network{
        get {
            if(!this.HasProp("__NetworkProxyArray"))
                this.__NetworkProxyArray := Win32FixedArray(this.ptr + 8, 1, WLAN_AVAILABLE_NETWORK_V2, "")
            return this.__NetworkProxyArray
        }
    }
}
