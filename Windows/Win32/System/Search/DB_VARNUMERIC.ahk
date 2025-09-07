#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DB_VARNUMERIC extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * @type {Integer}
     */
    precision {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    scale {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    sign {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Array<Byte>}
     */
    val{
        get {
            if(!this.HasProp("__valProxyArray"))
                this.__valProxyArray := Win32FixedArray(this.ptr + 3, 1, Primitive, "char")
            return this.__valProxyArray
        }
    }
}
