#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_802_11_PMKID extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    BSSIDInfoCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Pointer>}
     */
    BSSIDInfo {
        get {
            if(!this.HasProp("__BSSIDInfoProxyArray"))
                this.__BSSIDInfoProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__BSSIDInfoProxyArray
        }
    }
}
