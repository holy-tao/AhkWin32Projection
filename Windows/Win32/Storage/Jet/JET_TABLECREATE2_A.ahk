#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\StructuredStorage\JET_TABLEID.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 * @charset ANSI
 */
class JET_TABLECREATE2_A extends Win32Struct
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
     * @type {Pointer<Integer>}
     */
    szTableName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Integer>}
     */
    szTemplateTableName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
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
     * @type {Pointer<JET_COLUMNCREATE_A>}
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
     * @type {Pointer<JET_INDEXCREATE_A>}
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
     * @type {Pointer<Integer>}
     */
    szCallback {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
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
     * @type {JET_TABLEID}
     */
    tableid{
        get {
            if(!this.HasProp("__tableid"))
                this.__tableid := JET_TABLEID(80, this)
            return this.__tableid
        }
    }

    /**
     * @type {Integer}
     */
    cCreated {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }
}
