#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class IMAGE_SYMBOL extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class _Name extends Win32Struct {
        static sizeof => 8
        static packingSize => 2

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
    
    }

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
     * @type {_Name}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := %this.__Class%._Name(0, this)
            return this.__Name
        }
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
        get => NumGet(this, 12, "short")
        set => NumPut("short", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    StorageClass {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    NumberOfAuxSymbols {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }
}
