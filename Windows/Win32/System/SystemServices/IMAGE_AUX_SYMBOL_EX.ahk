#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IMAGE_AUX_SYMBOL_TOKEN_DEF.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class IMAGE_AUX_SYMBOL_EX extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {Integer}
     */
    WeakDefaultSymIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    WeakSearchType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    rgbReserved{
        get {
            if(!this.HasProp("__rgbReservedProxyArray"))
                this.__rgbReservedProxyArray := Win32FixedArray(this.ptr + 8, 12, Primitive, "char")
            return this.__rgbReservedProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Name{
        get {
            if(!this.HasProp("__NameProxyArray"))
                this.__NameProxyArray := Win32FixedArray(this.ptr + 0, 20, Primitive, "char")
            return this.__NameProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumberOfRelocations {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    NumberOfLinenumbers {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    CheckSum {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Number {
        get => NumGet(this, 12, "short")
        set => NumPut("short", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Selection {
        get => NumGet(this, 14, "char")
        set => NumPut("char", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    bReserved {
        get => NumGet(this, 15, "char")
        set => NumPut("char", value, this, 15)
    }

    /**
     * @type {Integer}
     */
    HighNumber {
        get => NumGet(this, 16, "short")
        set => NumPut("short", value, this, 16)
    }

    /**
     * @type {Array<Byte>}
     */
    rgbReserved1{
        get {
            if(!this.HasProp("__rgbReserved1ProxyArray"))
                this.__rgbReserved1ProxyArray := Win32FixedArray(this.ptr + 18, 2, Primitive, "char")
            return this.__rgbReserved1ProxyArray
        }
    }

    /**
     * @type {IMAGE_AUX_SYMBOL_TOKEN_DEF}
     */
    TokenDef{
        get {
            if(!this.HasProp("__TokenDef"))
                this.__TokenDef := IMAGE_AUX_SYMBOL_TOKEN_DEF(this.ptr + 0)
            return this.__TokenDef
        }
    }

    /**
     * @type {Array<Byte>}
     */
    rgbReserved12{
        get {
            if(!this.HasProp("__rgbReserved12ProxyArray"))
                this.__rgbReserved12ProxyArray := Win32FixedArray(this.ptr + 20, 2, Primitive, "char")
            return this.__rgbReserved12ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    crc {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    rgbReserved123{
        get {
            if(!this.HasProp("__rgbReserved123ProxyArray"))
                this.__rgbReserved123ProxyArray := Win32FixedArray(this.ptr + 4, 16, Primitive, "char")
            return this.__rgbReserved123ProxyArray
        }
    }
}
