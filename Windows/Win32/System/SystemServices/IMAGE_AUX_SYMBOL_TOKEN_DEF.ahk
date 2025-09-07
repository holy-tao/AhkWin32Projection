#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class IMAGE_AUX_SYMBOL_TOKEN_DEF extends Win32Struct
{
    static sizeof => 18

    static packingSize => 2

    /**
     * @type {Integer}
     */
    bAuxType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    bReserved {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    SymbolTableIndex {
        get => NumGet(this, 2, "uint")
        set => NumPut("uint", value, this, 2)
    }

    /**
     * @type {Array<Byte>}
     */
    rgbReserved{
        get {
            if(!this.HasProp("__rgbReservedProxyArray"))
                this.__rgbReservedProxyArray := Win32FixedArray(this.ptr + 6, 1, Primitive, "char")
            return this.__rgbReservedProxyArray
        }
    }
}
