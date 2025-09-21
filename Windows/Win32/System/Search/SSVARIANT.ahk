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
    static sizeof => 16

    static packingSize => 4

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

    /**
     * @type {Integer}
     */
    bTinyIntVal {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    sShortIntVal {
        get => NumGet(this, 12, "short")
        set => NumPut("short", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    lIntVal {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    llBigIntVal {
        get => NumGet(this, 12, "int64")
        set => NumPut("int64", value, this, 12)
    }

    /**
     * @type {Float}
     */
    fltRealVal {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * @type {Float}
     */
    dblFloatVal {
        get => NumGet(this, 12, "double")
        set => NumPut("double", value, this, 12)
    }

    /**
     * @type {CY}
     */
    cyMoneyVal{
        get {
            if(!this.HasProp("__cyMoneyVal"))
                this.__cyMoneyVal := CY(this.ptr + 12)
            return this.__cyMoneyVal
        }
    }

    /**
     * @type {Integer}
     */
    sActualLength {
        get => NumGet(this, 12, "short")
        set => NumPut("short", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    sMaxLength {
        get => NumGet(this, 14, "short")
        set => NumPut("short", value, this, 14)
    }

    /**
     * @type {Pointer<Char>}
     */
    pwchNCharVal {
        get => NumGet(this, 20, "ptr")
        set => NumPut("ptr", value, this, 20)
    }

    /**
     * @type {Array<Byte>}
     */
    rgbReserved{
        get {
            if(!this.HasProp("__rgbReservedProxyArray"))
                this.__rgbReservedProxyArray := Win32FixedArray(this.ptr + 28, 5, Primitive, "char")
            return this.__rgbReservedProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Pointer<Char>}
     */
    pwchReserved {
        get => NumGet(this, 44, "ptr")
        set => NumPut("ptr", value, this, 44)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pchCharVal {
        get => NumGet(this, 20, "ptr")
        set => NumPut("ptr", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    fBitVal {
        get => NumGet(this, 12, "short")
        set => NumPut("short", value, this, 12)
    }

    /**
     * @type {Array<Byte>}
     */
    rgbGuidVal{
        get {
            if(!this.HasProp("__rgbGuidValProxyArray"))
                this.__rgbGuidValProxyArray := Win32FixedArray(this.ptr + 12, 16, Primitive, "char")
            return this.__rgbGuidValProxyArray
        }
    }

    /**
     * @type {DB_NUMERIC}
     */
    numNumericVal{
        get {
            if(!this.HasProp("__numNumericVal"))
                this.__numNumericVal := DB_NUMERIC(this.ptr + 12)
            return this.__numNumericVal
        }
    }

    /**
     * @type {Pointer<Byte>}
     */
    prgbBinaryVal {
        get => NumGet(this, 20, "ptr")
        set => NumPut("ptr", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    dwReserved12 {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {DBTIMESTAMP}
     */
    tsDateTimeVal{
        get {
            if(!this.HasProp("__tsDateTimeVal"))
                this.__tsDateTimeVal := DBTIMESTAMP(this.ptr + 12)
            return this.__tsDateTimeVal
        }
    }

    /**
     * @type {Integer}
     */
    dwActualLength {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<Byte>}
     */
    rgMetadata{
        get {
            if(!this.HasProp("__rgMetadataProxyArray"))
                this.__rgMetadataProxyArray := Win32FixedArray(this.ptr + 16, 16, Primitive, "char")
            return this.__rgMetadataProxyArray
        }
    }

    /**
     * @type {Pointer<Byte>}
     */
    pUnknownData {
        get => NumGet(this, 36, "ptr")
        set => NumPut("ptr", value, this, 36)
    }

    /**
     * @type {DBOBJECT}
     */
    dbobj{
        get {
            if(!this.HasProp("__dbobj"))
                this.__dbobj := DBOBJECT(this.ptr + 12)
            return this.__dbobj
        }
    }

    /**
     * @type {Pointer<IUnknown>}
     */
    pUnk {
        get => NumGet(this, 28, "ptr")
        set => NumPut("ptr", value, this, 28)
    }
}
