#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 */
class MIDL_FORMAT_STRING extends Win32Struct {
    static sizeof => 4

    static packingSize => 2

    /**
     * @type {Integer}
     */
    Pad {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    Format {
        get {
            if(!this.HasProp("__FormatProxyArray"))
                this.__FormatProxyArray := Win32FixedArray(this.ptr + 2, 1, Primitive, "char")
            return this.__FormatProxyArray
        }
    }
}
