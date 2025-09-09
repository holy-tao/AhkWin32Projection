#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_802_11_NETWORK_TYPE_LIST extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    NumberOfItems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Int32>}
     */
    NetworkType{
        get {
            if(!this.HasProp("__NetworkTypeProxyArray"))
                this.__NetworkTypeProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "int")
            return this.__NetworkTypeProxyArray
        }
    }
}
