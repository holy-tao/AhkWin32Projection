#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Com\CY.ahk
#Include .\DB_NUMERIC.ahk
#Include .\DBTIMESTAMP.ahk
#Include .\DBOBJECT.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class SSVARIANT extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    vt {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    class _NCharVal extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        /**
         * @type {Integer}
         */
        sActualLength {
            get => NumGet(this, 0, "short")
            set => NumPut("short", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        sMaxLength {
            get => NumGet(this, 2, "short")
            set => NumPut("short", value, this, 2)
        }
    
        /**
         * @type {Pointer<Char>}
         */
        pwchNCharVal {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Array<Byte>}
         */
        rgbReserved{
            get {
                if(!this.HasProp("__rgbReservedProxyArray"))
                    this.__rgbReservedProxyArray := Win32FixedArray(this.ptr + 16, 5, Primitive, "char")
                return this.__rgbReservedProxyArray
            }
        }
    
        /**
         * @type {Integer}
         */
        dwReserved {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }
    
        /**
         * @type {Pointer<Char>}
         */
        pwchReserved {
            get => NumGet(this, 32, "ptr")
            set => NumPut("ptr", value, this, 32)
        }
    
    }

    class _CharVal extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        /**
         * @type {Integer}
         */
        sActualLength {
            get => NumGet(this, 0, "short")
            set => NumPut("short", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        sMaxLength {
            get => NumGet(this, 2, "short")
            set => NumPut("short", value, this, 2)
        }
    
        /**
         * @type {Pointer<Byte>}
         */
        pchCharVal {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Array<Byte>}
         */
        rgbReserved{
            get {
                if(!this.HasProp("__rgbReservedProxyArray"))
                    this.__rgbReservedProxyArray := Win32FixedArray(this.ptr + 16, 5, Primitive, "char")
                return this.__rgbReservedProxyArray
            }
        }
    
        /**
         * @type {Integer}
         */
        dwReserved {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }
    
        /**
         * @type {Pointer<Char>}
         */
        pwchReserved {
            get => NumGet(this, 32, "ptr")
            set => NumPut("ptr", value, this, 32)
        }
    
    }

    class _BinaryVal extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        /**
         * @type {Integer}
         */
        sActualLength {
            get => NumGet(this, 0, "short")
            set => NumPut("short", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        sMaxLength {
            get => NumGet(this, 2, "short")
            set => NumPut("short", value, this, 2)
        }
    
        /**
         * @type {Pointer<Byte>}
         */
        prgbBinaryVal {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        dwReserved {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
    }

    class _UnknownType extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        /**
         * @type {Integer}
         */
        dwActualLength {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Array<Byte>}
         */
        rgMetadata{
            get {
                if(!this.HasProp("__rgMetadataProxyArray"))
                    this.__rgMetadataProxyArray := Win32FixedArray(this.ptr + 4, 16, Primitive, "char")
                return this.__rgMetadataProxyArray
            }
        }
    
        /**
         * @type {Pointer<Byte>}
         */
        pUnknownData {
            get => NumGet(this, 24, "ptr")
            set => NumPut("ptr", value, this, 24)
        }
    
    }

    class _BLOBType extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        /**
         * @type {DBOBJECT}
         */
        dbobj{
            get {
                if(!this.HasProp("__dbobj"))
                    this.__dbobj := DBOBJECT(this.ptr + 0)
                return this.__dbobj
            }
        }
    
        /**
         * @type {Pointer<IUnknown>}
         */
        pUnk {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
    }

    /**
     * @type {Integer}
     */
    bTinyIntVal {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    sShortIntVal {
        get => NumGet(this, 16, "short")
        set => NumPut("short", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    lIntVal {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    llBigIntVal {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * @type {Float}
     */
    fltRealVal {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * @type {Float}
     */
    dblFloatVal {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * @type {CY}
     */
    cyMoneyVal{
        get {
            if(!this.HasProp("__cyMoneyVal"))
                this.__cyMoneyVal := CY(this.ptr + 16)
            return this.__cyMoneyVal
        }
    }

    /**
     * @type {_NCharVal}
     */
    NCharVal{
        get {
            if(!this.HasProp("__NCharVal"))
                this.__NCharVal := %this.__Class%._NCharVal(this.ptr + 16)
            return this.__NCharVal
        }
    }

    /**
     * @type {_CharVal}
     */
    CharVal{
        get {
            if(!this.HasProp("__CharVal"))
                this.__CharVal := %this.__Class%._CharVal(this.ptr + 16)
            return this.__CharVal
        }
    }

    /**
     * @type {Integer}
     */
    fBitVal {
        get => NumGet(this, 16, "short")
        set => NumPut("short", value, this, 16)
    }

    /**
     * @type {Array<Byte>}
     */
    rgbGuidVal{
        get {
            if(!this.HasProp("__rgbGuidValProxyArray"))
                this.__rgbGuidValProxyArray := Win32FixedArray(this.ptr + 16, 16, Primitive, "char")
            return this.__rgbGuidValProxyArray
        }
    }

    /**
     * @type {DB_NUMERIC}
     */
    numNumericVal{
        get {
            if(!this.HasProp("__numNumericVal"))
                this.__numNumericVal := DB_NUMERIC(this.ptr + 16)
            return this.__numNumericVal
        }
    }

    /**
     * @type {_BinaryVal}
     */
    BinaryVal{
        get {
            if(!this.HasProp("__BinaryVal"))
                this.__BinaryVal := %this.__Class%._BinaryVal(this.ptr + 16)
            return this.__BinaryVal
        }
    }

    /**
     * @type {DBTIMESTAMP}
     */
    tsDateTimeVal{
        get {
            if(!this.HasProp("__tsDateTimeVal"))
                this.__tsDateTimeVal := DBTIMESTAMP(this.ptr + 16)
            return this.__tsDateTimeVal
        }
    }

    /**
     * @type {_UnknownType}
     */
    UnknownType{
        get {
            if(!this.HasProp("__UnknownType"))
                this.__UnknownType := %this.__Class%._UnknownType(this.ptr + 16)
            return this.__UnknownType
        }
    }

    /**
     * @type {_BLOBType}
     */
    BLOBType{
        get {
            if(!this.HasProp("__BLOBType"))
                this.__BLOBType := %this.__Class%._BLOBType(this.ptr + 16)
            return this.__BLOBType
        }
    }
}
