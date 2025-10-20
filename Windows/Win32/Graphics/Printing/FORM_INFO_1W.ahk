#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include ..\..\Foundation\RECTL.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/printdocs/form-info-1
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class FORM_INFO_1W extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {SIZE}
     */
    Size{
        get {
            if(!this.HasProp("__Size"))
                this.__Size := SIZE(16, this)
            return this.__Size
        }
    }

    /**
     * @type {RECTL}
     */
    ImageableArea{
        get {
            if(!this.HasProp("__ImageableArea"))
                this.__ImageableArea := RECTL(24, this)
            return this.__ImageableArea
        }
    }
}
