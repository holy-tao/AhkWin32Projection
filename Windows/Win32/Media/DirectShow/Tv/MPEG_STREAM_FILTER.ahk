#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MPEG_STREAM_FILTER extends Win32Struct
{
    static sizeof => 42

    static packingSize => 1

    /**
     * @type {Integer}
     */
    wPidValue {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFilterSize {
        get => NumGet(this, 2, "uint")
        set => NumPut("uint", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    fCrcEnabled {
        get => NumGet(this, 6, "int")
        set => NumPut("int", value, this, 6)
    }

    /**
     * @type {Array<Byte>}
     */
    rgchFilter{
        get {
            if(!this.HasProp("__rgchFilterProxyArray"))
                this.__rgchFilterProxyArray := Win32FixedArray(this.ptr + 10, 1, Primitive, "char")
            return this.__rgchFilterProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    rgchMask{
        get {
            if(!this.HasProp("__rgchMaskProxyArray"))
                this.__rgchMaskProxyArray := Win32FixedArray(this.ptr + 26, 1, Primitive, "char")
            return this.__rgchMaskProxyArray
        }
    }
}
