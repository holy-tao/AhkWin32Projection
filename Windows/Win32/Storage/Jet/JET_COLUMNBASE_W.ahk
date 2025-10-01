#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 * @charset Unicode
 */
class JET_COLUMNBASE_W extends Win32Struct
{
    static sizeof => 1052

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    columnid {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    coltyp {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    wCountry {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    langid {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    cp {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    wFiller {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    cbMax {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    grbit {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<UInt16>}
     */
    szBaseTableName{
        get {
            if(!this.HasProp("__szBaseTableNameProxyArray"))
                this.__szBaseTableNameProxyArray := Win32FixedArray(this.ptr + 28, 256, Primitive, "ushort")
            return this.__szBaseTableNameProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    szBaseColumnName{
        get {
            if(!this.HasProp("__szBaseColumnNameProxyArray"))
                this.__szBaseColumnNameProxyArray := Win32FixedArray(this.ptr + 540, 256, Primitive, "ushort")
            return this.__szBaseColumnNameProxyArray
        }
    }
}
