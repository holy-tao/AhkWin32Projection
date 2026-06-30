#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_802_11_CONFIGURATION.ahk
#Include .\NDIS_802_11_NETWORK_INFRASTRUCTURE.ahk
#Include .\NDIS_802_11_CONFIGURATION_FH.ahk
#Include .\NDIS_WLAN_BSSID_EX.ahk
#Include .\NDIS_802_11_SSID.ahk
#Include .\NDIS_802_11_NETWORK_TYPE.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_802_11_BSSID_LIST_EX extends Win32Struct {
    static sizeof => 124

    static packingSize => 4

    /**
     * @type {Integer}
     */
    NumberOfItems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {NDIS_WLAN_BSSID_EX}
     */
    Bssid {
        get {
            if(!this.HasProp("__BssidProxyArray"))
                this.__BssidProxyArray := Win32FixedArray(this.ptr + 4, 1, NDIS_WLAN_BSSID_EX, "")
            return this.__BssidProxyArray
        }
    }
}
