#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Com\CY.ahk
#Include ..\..\Foundation\DECIMAL.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class _wireVARIANT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    clSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    rpcReserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    vt {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    wReserved1 {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    wReserved2 {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    wReserved3 {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    llVal {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    lVal {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    bVal {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    iVal {
        get => NumGet(this, 16, "short")
        set => NumPut("short", value, this, 16)
    }

    /**
     * @type {Float}
     */
    fltVal {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * @type {Float}
     */
    dblVal {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * @type {VARIANT_BOOL}
     */
    boolVal {
        get => NumGet(this, 16, "short")
        set => NumPut("short", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    scode {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {CY}
     */
    cyVal{
        get {
            if(!this.HasProp("__cyVal"))
                this.__cyVal := CY(16, this)
            return this.__cyVal
        }
    }

    /**
     * @type {Float}
     */
    date {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * @type {Pointer<FLAGGED_WORD_BLOB>}
     */
    bstrVal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<IUnknown>}
     */
    punkVal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<IDispatch>}
     */
    pdispVal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<_wireSAFEARRAY>}
     */
    parray {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<_wireBRECORD>}
     */
    brecVal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbVal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Int16>}
     */
    piVal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Int32>}
     */
    plVal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Int64>}
     */
    pllVal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Single>}
     */
    pfltVal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Double>}
     */
    pdblVal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<VARIANT_BOOL>}
     */
    pboolVal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Int32>}
     */
    pscode {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<CY>}
     */
    pcyVal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Double>}
     */
    pdate {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<FLAGGED_WORD_BLOB>}
     */
    pbstrVal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<IUnknown>}
     */
    ppunkVal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<IDispatch>}
     */
    ppdispVal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<_wireSAFEARRAY>}
     */
    pparray {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<_wireVARIANT>}
     */
    pvarVal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {CHAR}
     */
    cVal {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    uiVal {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ulVal {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ullVal {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    intVal {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    uintVal {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {DECIMAL}
     */
    decVal{
        get {
            if(!this.HasProp("__decVal"))
                this.__decVal := DECIMAL(16, this)
            return this.__decVal
        }
    }

    /**
     * @type {Pointer<DECIMAL>}
     */
    pdecVal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {PSTR}
     */
    pcVal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    puiVal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<UInt32>}
     */
    pulVal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<UInt64>}
     */
    pullVal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Int32>}
     */
    pintVal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<UInt32>}
     */
    puintVal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
