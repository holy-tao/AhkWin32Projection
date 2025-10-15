#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class PRINTER_INFO_7W extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pszObjectGUID{
        get {
            if(!this.HasProp("__pszObjectGUID"))
                this.__pszObjectGUID := PWSTR(this.ptr + 0)
            return this.__pszObjectGUID
        }
    }

    /**
     * @type {Integer}
     */
    dwAction {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
