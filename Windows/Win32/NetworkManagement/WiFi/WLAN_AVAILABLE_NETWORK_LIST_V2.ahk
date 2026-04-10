#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WLAN_AVAILABLE_NETWORK_V2.ahk
#Include .\DOT11_SSID.ahk
#Include .\DOT11_BSS_TYPE.ahk
#Include .\DOT11_PHY_TYPE.ahk
#Include .\DOT11_AUTH_ALGORITHM.ahk
#Include .\DOT11_CIPHER_ALGORITHM.ahk
#Include .\DOT11_ACCESSNETWORKOPTIONS.ahk
#Include .\DOT11_VENUEINFO.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class WLAN_AVAILABLE_NETWORK_LIST_V2 extends Win32Struct {
    static sizeof => 652

    static packingSize => 4

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
     * @type {WLAN_AVAILABLE_NETWORK_V2}
     */
    Network {
        get {
            if(!this.HasProp("__NetworkProxyArray"))
                this.__NetworkProxyArray := Win32FixedArray(this.ptr + 8, 1, WLAN_AVAILABLE_NETWORK_V2, "")
            return this.__NetworkProxyArray
        }
    }
}
