#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class IMAGE_SYMBOL_EX extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Array<Byte>}
     */
    ShortName{
        get {
            if(!this.HasProp("__ShortNameProxyArray"))
                this.__ShortNameProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "char")
            return this.__ShortNameProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Short {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Long {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<UInt32>}
     */
    LongName{
        get {
            if(!this.HasProp("__LongNameProxyArray"))
                this.__LongNameProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "uint")
            return this.__LongNameProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    SectionNumber {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    StorageClass {
        get => NumGet(this, 18, "char")
        set => NumPut("char", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    NumberOfAuxSymbols {
        get => NumGet(this, 19, "char")
        set => NumPut("char", value, this, 19)
    }
}
