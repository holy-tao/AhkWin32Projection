#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_802_11_NON_BCAST_SSID_LIST extends Win32Struct {
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
     * @type {Array<Pointer>}
     */
    Non_Bcast_Ssid {
        get {
            if(!this.HasProp("__Non_Bcast_SsidProxyArray"))
                this.__Non_Bcast_SsidProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__Non_Bcast_SsidProxyArray
        }
    }
}
