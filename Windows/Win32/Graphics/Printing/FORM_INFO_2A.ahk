#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include ..\..\Foundation\RECTL.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/printdocs/form-info-2
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class FORM_INFO_2A extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PSTR}
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

    /**
     * @type {PSTR}
     */
    pKeyword {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    StringType {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {PSTR}
     */
    pMuiDll {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    dwResourceId {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {PSTR}
     */
    pDisplayName {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    wLangId {
        get => NumGet(this, 80, "ushort")
        set => NumPut("ushort", value, this, 80)
    }
}
