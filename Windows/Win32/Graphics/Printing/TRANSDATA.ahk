#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class TRANSDATA extends Win32Struct
{
    static sizeof => 6

    static packingSize => 3

    /**
     * @type {Integer}
     */
    ubCodePageID {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ubType {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    sCode {
        get => NumGet(this, 3, "short")
        set => NumPut("short", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    ubCode {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Array<Byte>}
     */
    ubPairs{
        get {
            if(!this.HasProp("__ubPairsProxyArray"))
                this.__ubPairsProxyArray := Win32FixedArray(this.ptr + 3, 2, Primitive, "char")
            return this.__ubPairsProxyArray
        }
    }
}
