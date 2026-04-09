#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class CONFIG_INFO_DATA_1 extends Win32Struct {
    static sizeof => 132

    static packingSize => 4

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 0, 128, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }
}
