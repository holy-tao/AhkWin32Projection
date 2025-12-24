#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IMAGE_AUX_SYMBOL_TOKEN_DEF.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class IMAGE_AUX_SYMBOL extends Win32Struct
{
    static sizeof => 100

    static packingSize => 4

    class _Sym extends Win32Struct {
        static sizeof => 20
        static packingSize => 4

        class _Misc_e__Union extends Win32Struct {
            static sizeof => 4
            static packingSize => 2
    
            class _LnSz extends Win32Struct {
                static sizeof => 4
                static packingSize => 2
        
                /**
                 * @type {Integer}
                 */
                Linenumber {
                    get => NumGet(this, 0, "ushort")
                    set => NumPut("ushort", value, this, 0)
                }
            
                /**
                 * @type {Integer}
                 */
                Size {
                    get => NumGet(this, 2, "ushort")
                    set => NumPut("ushort", value, this, 2)
                }
            
            }
        
            /**
             * @type {_LnSz}
             */
            LnSz{
                get {
                    if(!this.HasProp("__LnSz"))
                        this.__LnSz := %this.__Class%._LnSz(0, this)
                    return this.__LnSz
                }
            }
        
            /**
             * @type {Integer}
             */
            TotalSize {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
        }
    
        class _FcnAry_e__Union extends Win32Struct {
            static sizeof => 8
            static packingSize => 4
    
            class _Function extends Win32Struct {
                static sizeof => 8
                static packingSize => 4
        
                /**
                 * @type {Integer}
                 */
                PointerToLinenumber {
                    get => NumGet(this, 0, "uint")
                    set => NumPut("uint", value, this, 0)
                }
            
                /**
                 * @type {Integer}
                 */
                PointerToNextFunction {
                    get => NumGet(this, 4, "uint")
                    set => NumPut("uint", value, this, 4)
                }
            
            }
        
            class _Array extends Win32Struct {
                static sizeof => 8
                static packingSize => 2
        
                /**
                 * @type {Array<UInt16>}
                 */
                Dimension{
                    get {
                        if(!this.HasProp("__DimensionProxyArray"))
                            this.__DimensionProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "ushort")
                        return this.__DimensionProxyArray
                    }
                }
            
            }
        
            /**
             * @type {_Function}
             */
            Function{
                get {
                    if(!this.HasProp("__Function"))
                        this.__Function := %this.__Class%._Function(0, this)
                    return this.__Function
                }
            }
        
            /**
             * @type {_Array}
             */
            Array{
                get {
                    if(!this.HasProp("__Array"))
                        this.__Array := %this.__Class%._Array(0, this)
                    return this.__Array
                }
            }
        
        }
    
        /**
         * @type {Integer}
         */
        TagIndex {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {_Misc_e__Union}
         */
        Misc{
            get {
                if(!this.HasProp("__Misc"))
                    this.__Misc := %this.__Class%._Misc_e__Union(4, this)
                return this.__Misc
            }
        }
    
        /**
         * @type {_FcnAry_e__Union}
         */
        FcnAry{
            get {
                if(!this.HasProp("__FcnAry"))
                    this.__FcnAry := %this.__Class%._FcnAry_e__Union(8, this)
                return this.__FcnAry
            }
        }
    
        /**
         * @type {Integer}
         */
        TvIndex {
            get => NumGet(this, 16, "ushort")
            set => NumPut("ushort", value, this, 16)
        }
    
    }

    class _File extends Win32Struct {
        static sizeof => 18
        static packingSize => 1

        /**
         * @type {Array<Byte>}
         */
        Name{
            get {
                if(!this.HasProp("__NameProxyArray"))
                    this.__NameProxyArray := Win32FixedArray(this.ptr + 0, 18, Primitive, "char")
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
                    this.__rgbReservedProxyArray := Win32FixedArray(this.ptr + 4, 14, Primitive, "char")
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
