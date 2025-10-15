#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class PROVIDOR_INFO_2W extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pOrder{
        get {
            if(!this.HasProp("__pOrder"))
                this.__pOrder := PWSTR(this.ptr + 0)
            return this.__pOrder
        }
    }
}
