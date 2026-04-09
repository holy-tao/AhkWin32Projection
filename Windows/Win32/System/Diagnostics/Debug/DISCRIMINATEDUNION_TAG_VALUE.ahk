#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class DISCRIMINATEDUNION_TAG_VALUE extends Win32Struct {
    static sizeof => 17

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    value {
        get {
            if(!this.HasProp("__valueProxyArray"))
                this.__valueProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__valueProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    valueSizeBytes {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }
}
