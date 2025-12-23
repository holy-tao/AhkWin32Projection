#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IMAGE_AUX_SYMBOL_TOKEN_DEF.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class IMAGE_AUX_SYMBOL_EX extends Win32Struct
{
    static sizeof => 104

    static packingSize => 4

    class _Sym extends Win32Struct {
        static sizeof => 20
        static packingSize => 4

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
    
    }

    class _File extends Win32Struct {
        static sizeof => 20
        static packingSize => 1

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
    
    }

    class _Section extends Win32Struct {
        static sizeof => 20
        static packingSize => 4

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
        rgbReserved{
            get {
                if(!this.HasProp("__rgbReservedProxyArray"))
                    this.__rgbReservedProxyArray := Win32FixedArray(this.ptr + 18, 2, Primitive, "char")
                return this.__rgbReservedProxyArray
            }
        }
    
    }

    class _CRC extends Win32Struct {
        static sizeof => 20
        static packingSize => 4

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
        rgbReserved{
            get {
                if(!this.HasProp("__rgbReservedProxyArray"))
                    this.__rgbReservedProxyArray := Win32FixedArray(this.ptr + 4, 16, Primitive, "char")
                return this.__rgbReservedProxyArray
            }
        }
    
    }

    /**
     * @type {_Sym}
     */
    Sym{
        get {
            if(!this.HasProp("__Sym"))
                this.__Sym := %this.__Class%._Sym(0, this)
            return this.__Sym
        }
    }

    /**
     * @type {_File}
     */
    File{
        get {
            if(!this.HasProp("__File"))
                this.__File := %this.__Class%._File(0, this)
            return this.__File
        }
    }

    /**
     * @type {_Section}
     */
    Section{
        get {
            if(!this.HasProp("__Section"))
                this.__Section := %this.__Class%._Section(0, this)
            return this.__Section
        }
    }

    /**
     * @type {IMAGE_AUX_SYMBOL_TOKEN_DEF}
     */
    TokenDef{
        get {
            if(!this.HasProp("__TokenDef"))
                this.__TokenDef := IMAGE_AUX_SYMBOL_TOKEN_DEF(0, this)
            return this.__TokenDef
        }
    }

    /**
     * @type {Array<Byte>}
     */
    rgbReserved{
        get {
            if(!this.HasProp("__rgbReservedProxyArray"))
                this.__rgbReservedProxyArray := Win32FixedArray(this.ptr + 20, 2, Primitive, "char")
            return this.__rgbReservedProxyArray
        }
    }

    /**
     * @type {_CRC}
     */
    CRC{
        get {
            if(!this.HasProp("__CRC"))
                this.__CRC := %this.__Class%._CRC(0, this)
            return this.__CRC
        }
    }
}
