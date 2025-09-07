#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class USerializedSet extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<UInt16>}
     */
    array {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    bmpLength {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    length {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Array<UInt16>}
     */
    staticArray{
        get {
            if(!this.HasProp("__staticArrayProxyArray"))
                this.__staticArrayProxyArray := Win32FixedArray(this.ptr + 16, 2, Primitive, "ushort")
            return this.__staticArrayProxyArray
        }
    }
}
