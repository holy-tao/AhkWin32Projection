#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Com\CY.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\SBinary.ahk
#Include .\SShortArray.ahk
#Include .\SLongArray.ahk
#Include .\SRealArray.ahk
#Include .\SDoubleArray.ahk
#Include .\SCurrencyArray.ahk
#Include .\SAppTimeArray.ahk
#Include .\SDateTimeArray.ahk
#Include .\SBinaryArray.ahk
#Include .\SLPSTRArray.ahk
#Include .\SWStringArray.ahk
#Include .\SGuidArray.ahk
#Include .\SLargeIntegerArray.ahk

/**
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class __UPV extends Win32Struct
{
    static sizeof => 312

    static packingSize => 8

    /**
     * @type {Integer}
     */
    i {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    l {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ul {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Float}
     */
    flt {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * @type {Float}
     */
    dbl {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    b {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {CY}
     */
    cur{
        get {
            if(!this.HasProp("__cur"))
                this.__cur := CY(this.ptr + 0)
            return this.__cur
        }
    }

    /**
     * @type {Float}
     */
    at {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * @type {FILETIME}
     */
    ft{
        get {
            if(!this.HasProp("__ft"))
                this.__ft := FILETIME(this.ptr + 0)
            return this.__ft
        }
    }

    /**
     * @type {Pointer<Ptr>}
     */
    lpszA {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {SBinary}
     */
    bin{
        get {
            if(!this.HasProp("__bin"))
                this.__bin := SBinary(this.ptr + 0)
            return this.__bin
        }
    }

    /**
     * @type {Pointer<Ptr>}
     */
    lpszW {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    lpguid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    li {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {SShortArray}
     */
    MVi{
        get {
            if(!this.HasProp("__MVi"))
                this.__MVi := SShortArray(this.ptr + 0)
            return this.__MVi
        }
    }

    /**
     * @type {SLongArray}
     */
    MVl{
        get {
            if(!this.HasProp("__MVl"))
                this.__MVl := SLongArray(this.ptr + 0)
            return this.__MVl
        }
    }

    /**
     * @type {SRealArray}
     */
    MVflt{
        get {
            if(!this.HasProp("__MVflt"))
                this.__MVflt := SRealArray(this.ptr + 0)
            return this.__MVflt
        }
    }

    /**
     * @type {SDoubleArray}
     */
    MVdbl{
        get {
            if(!this.HasProp("__MVdbl"))
                this.__MVdbl := SDoubleArray(this.ptr + 0)
            return this.__MVdbl
        }
    }

    /**
     * @type {SCurrencyArray}
     */
    MVcur{
        get {
            if(!this.HasProp("__MVcur"))
                this.__MVcur := SCurrencyArray(this.ptr + 0)
            return this.__MVcur
        }
    }

    /**
     * @type {SAppTimeArray}
     */
    MVat{
        get {
            if(!this.HasProp("__MVat"))
                this.__MVat := SAppTimeArray(this.ptr + 0)
            return this.__MVat
        }
    }

    /**
     * @type {SDateTimeArray}
     */
    MVft{
        get {
            if(!this.HasProp("__MVft"))
                this.__MVft := SDateTimeArray(this.ptr + 0)
            return this.__MVft
        }
    }

    /**
     * @type {SBinaryArray}
     */
    MVbin{
        get {
            if(!this.HasProp("__MVbin"))
                this.__MVbin := SBinaryArray(this.ptr + 0)
            return this.__MVbin
        }
    }

    /**
     * @type {SLPSTRArray}
     */
    MVszA{
        get {
            if(!this.HasProp("__MVszA"))
                this.__MVszA := SLPSTRArray(this.ptr + 0)
            return this.__MVszA
        }
    }

    /**
     * @type {SWStringArray}
     */
    MVszW{
        get {
            if(!this.HasProp("__MVszW"))
                this.__MVszW := SWStringArray(this.ptr + 0)
            return this.__MVszW
        }
    }

    /**
     * @type {SGuidArray}
     */
    MVguid{
        get {
            if(!this.HasProp("__MVguid"))
                this.__MVguid := SGuidArray(this.ptr + 0)
            return this.__MVguid
        }
    }

    /**
     * @type {SLargeIntegerArray}
     */
    MVli{
        get {
            if(!this.HasProp("__MVli"))
                this.__MVli := SLargeIntegerArray(this.ptr + 0)
            return this.__MVli
        }
    }

    /**
     * @type {Integer}
     */
    err {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    x {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
