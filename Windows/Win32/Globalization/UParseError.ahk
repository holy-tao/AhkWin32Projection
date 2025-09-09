#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UParseError extends Win32Struct
{
    static sizeof => 72

    static packingSize => 4

    /**
     * @type {Integer}
     */
    line {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    offset {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Array<UInt16>}
     */
    preContext{
        get {
            if(!this.HasProp("__preContextProxyArray"))
                this.__preContextProxyArray := Win32FixedArray(this.ptr + 8, 16, Primitive, "ushort")
            return this.__preContextProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    postContext{
        get {
            if(!this.HasProp("__postContextProxyArray"))
                this.__postContextProxyArray := Win32FixedArray(this.ptr + 40, 16, Primitive, "ushort")
            return this.__postContextProxyArray
        }
    }
}
