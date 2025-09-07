#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBVARYCHAR extends Win32Struct
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
     * @type {Array<SByte>}
     */
    str{
        get {
            if(!this.HasProp("__strProxyArray"))
                this.__strProxyArray := Win32FixedArray(this.ptr + 2, 1, Primitive, "char")
            return this.__strProxyArray
        }
    }
}
