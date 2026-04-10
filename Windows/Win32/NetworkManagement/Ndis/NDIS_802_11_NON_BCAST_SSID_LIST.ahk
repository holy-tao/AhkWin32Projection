#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_802_11_SSID.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_802_11_NON_BCAST_SSID_LIST extends Win32Struct {
    static sizeof => 40

    static packingSize => 4

    /**
     * @type {Integer}
     */
    NumberOfItems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {NDIS_802_11_SSID}
     */
    Non_Bcast_Ssid {
        get {
            if(!this.HasProp("__Non_Bcast_SsidProxyArray"))
                this.__Non_Bcast_SsidProxyArray := Win32FixedArray(this.ptr + 4, 1, NDIS_802_11_SSID, "")
            return this.__Non_Bcast_SsidProxyArray
        }
    }
}
