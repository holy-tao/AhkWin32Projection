#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class DBVARYCHAR extends Win32Struct {
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
     * @type {Array<Integer>}
     */
    str {
        get {
            if(!this.HasProp("__strProxyArray"))
                this.__strProxyArray := Win32FixedArray(this.ptr + 2, 8001, Primitive, "char")
            return this.__strProxyArray
        }
    }
}
