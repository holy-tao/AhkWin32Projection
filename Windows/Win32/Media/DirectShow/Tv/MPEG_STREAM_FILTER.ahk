#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MPEG_STREAM_FILTER extends Win32Struct
{
    static sizeof => 44

    static packingSize => 4

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
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {BOOL}
     */
    fCrcEnabled{
        get {
            if(!this.HasProp("__fCrcEnabled"))
                this.__fCrcEnabled := BOOL(this.ptr + 8)
            return this.__fCrcEnabled
        }
    }

    /**
     * @type {Array<Byte>}
     */
    rgchFilter{
        get {
            if(!this.HasProp("__rgchFilterProxyArray"))
                this.__rgchFilterProxyArray := Win32FixedArray(this.ptr + 12, 16, Primitive, "char")
            return this.__rgchFilterProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    rgchMask{
        get {
            if(!this.HasProp("__rgchMaskProxyArray"))
                this.__rgchMaskProxyArray := Win32FixedArray(this.ptr + 28, 16, Primitive, "char")
            return this.__rgchMaskProxyArray
        }
    }
}
