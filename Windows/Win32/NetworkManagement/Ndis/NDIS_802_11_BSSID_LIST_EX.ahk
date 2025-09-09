#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_802_11_SSID.ahk
#Include .\NDIS_802_11_CONFIGURATION_FH.ahk
#Include .\NDIS_802_11_CONFIGURATION.ahk
#Include .\NDIS_WLAN_BSSID_EX.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_802_11_BSSID_LIST_EX extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumberOfItems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<NDIS_WLAN_BSSID_EX>}
     */
    Bssid{
        get {
            if(!this.HasProp("__BssidProxyArray"))
                this.__BssidProxyArray := Win32FixedArray(this.ptr + 8, 1, NDIS_WLAN_BSSID_EX, "")
            return this.__BssidProxyArray
        }
    }
}
