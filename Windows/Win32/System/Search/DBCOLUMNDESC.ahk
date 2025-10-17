#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Storage\IndexServer\DBID.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBCOLUMNDESC extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pwszTypeName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<ITypeInfo>}
     */
    pTypeInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<DBPROPSET>}
     */
    rgPropertySets {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Guid>}
     */
    pclsid {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    cPropertySets {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer}
     */
    ulColumnSize {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {DBID}
     */
    dbcid{
        get {
            if(!this.HasProp("__dbcid"))
                this.__dbcid := DBID(48, this)
            return this.__dbcid
        }
    }

    /**
     * @type {Integer}
     */
    wType {
        get => NumGet(this, 80, "ushort")
        set => NumPut("ushort", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    bPrecision {
        get => NumGet(this, 82, "char")
        set => NumPut("char", value, this, 82)
    }

    /**
     * @type {Integer}
     */
    bScale {
        get => NumGet(this, 83, "char")
        set => NumPut("char", value, this, 83)
    }
}
