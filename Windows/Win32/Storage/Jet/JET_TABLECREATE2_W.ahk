#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 * @charset Unicode
 */
class JET_TABLECREATE2_W extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    szTableName{
        get {
            if(!this.HasProp("__szTableName"))
                this.__szTableName := PWSTR(this.ptr + 8)
            return this.__szTableName
        }
    }

    /**
     * @type {PWSTR}
     */
    szTemplateTableName{
        get {
            if(!this.HasProp("__szTemplateTableName"))
                this.__szTemplateTableName := PWSTR(this.ptr + 16)
            return this.__szTemplateTableName
        }
    }

    /**
     * @type {Integer}
     */
    ulPages {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    ulDensity {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Pointer<JET_COLUMNCREATE_W>}
     */
    rgcolumncreate {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    cColumns {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<JET_INDEXCREATE_W>}
     */
    rgindexcreate {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    cIndexes {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {PWSTR}
     */
    szCallback{
        get {
            if(!this.HasProp("__szCallback"))
                this.__szCallback := PWSTR(this.ptr + 64)
            return this.__szCallback
        }
    }

    /**
     * @type {Integer}
     */
    cbtyp {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    grbit {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Pointer}
     */
    tableid {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    cCreated {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }
}
