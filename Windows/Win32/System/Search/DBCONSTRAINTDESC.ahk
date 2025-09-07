#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBCONSTRAINTDESC extends Win32Struct
{
    static sizeof => 92

    static packingSize => 2

    /**
     * @type {Pointer<DBID>}
     */
    pConstraintID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ConstraintType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    cColumns {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }

    /**
     * @type {Pointer<DBID>}
     */
    rgColumnList {
        get => NumGet(this, 20, "ptr")
        set => NumPut("ptr", value, this, 20)
    }

    /**
     * @type {Pointer<DBID>}
     */
    pReferencedTableID {
        get => NumGet(this, 28, "ptr")
        set => NumPut("ptr", value, this, 28)
    }

    /**
     * @type {Pointer}
     */
    cForeignKeyColumns {
        get => NumGet(this, 36, "ptr")
        set => NumPut("ptr", value, this, 36)
    }

    /**
     * @type {Pointer<DBID>}
     */
    rgForeignKeyColumnList {
        get => NumGet(this, 44, "ptr")
        set => NumPut("ptr", value, this, 44)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pwszConstraintText {
        get => NumGet(this, 52, "ptr")
        set => NumPut("ptr", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    UpdateRule {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    DeleteRule {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    MatchType {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    Deferrability {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Pointer}
     */
    cReserved {
        get => NumGet(this, 76, "ptr")
        set => NumPut("ptr", value, this, 76)
    }

    /**
     * @type {Pointer<DBPROPSET>}
     */
    rgReserved {
        get => NumGet(this, 84, "ptr")
        set => NumPut("ptr", value, this, 84)
    }
}
