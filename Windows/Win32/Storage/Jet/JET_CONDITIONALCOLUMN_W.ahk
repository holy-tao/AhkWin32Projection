#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 * @charset Unicode
 */
class JET_CONDITIONALCOLUMN_W extends Win32Struct
{
    static sizeof => 24

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
    szColumnName{
        get {
            if(!this.HasProp("__szColumnName"))
                this.__szColumnName := PWSTR(this.ptr + 8)
            return this.__szColumnName
        }
    }

    /**
     * @type {Integer}
     */
    grbit {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
