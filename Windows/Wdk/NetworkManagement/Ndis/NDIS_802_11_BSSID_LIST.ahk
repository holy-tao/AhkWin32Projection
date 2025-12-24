#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_WLAN_BSSID.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_802_11_BSSID_LIST extends Win32Struct
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
     * @type {Array<NDIS_WLAN_BSSID>}
     */
    Bssid{
        get {
            if(!this.HasProp("__BssidProxyArray"))
                this.__BssidProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__BssidProxyArray
        }
    }
}
