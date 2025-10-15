#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class UDCR_TAG extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    bVersion {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    KID{
        get {
            if(!this.HasProp("__KIDProxyArray"))
                this.__KIDProxyArray := Win32FixedArray(this.ptr + 1, 25, Primitive, "char")
            return this.__KIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ullBaseCounter {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ullBaseCounterRange {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {BOOL}
     */
    fScrambled{
        get {
            if(!this.HasProp("__fScrambled"))
                this.__fScrambled := BOOL(this.ptr + 48)
            return this.__fScrambled
        }
    }

    /**
     * @type {Integer}
     */
    bStreamMark {
        get => NumGet(this, 52, "char")
        set => NumPut("char", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }
}
