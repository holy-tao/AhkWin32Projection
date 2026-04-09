#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class IF_PHYSICAL_ADDRESS_LH extends Win32Struct {
    static sizeof => 34

    static packingSize => 2

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    Address {
        get {
            if(!this.HasProp("__AddressProxyArray"))
                this.__AddressProxyArray := Win32FixedArray(this.ptr + 2, 32, Primitive, "char")
            return this.__AddressProxyArray
        }
    }
}
