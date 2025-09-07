#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBVARYBIN extends Win32Struct
{
    static sizeof => 8004

    static packingSize => 2

    /**
     * @type {Integer}
     */
    len {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    array{
        get {
            if(!this.HasProp("__arrayProxyArray"))
                this.__arrayProxyArray := Win32FixedArray(this.ptr + 2, 1, Primitive, "char")
            return this.__arrayProxyArray
        }
    }
}
