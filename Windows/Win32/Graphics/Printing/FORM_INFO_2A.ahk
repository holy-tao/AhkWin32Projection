#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include ..\..\Foundation\RECTL.ahk

/**
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
    pName{
        get {
            if(!this.HasProp("__pName"))
                this.__pName := PSTR(this.ptr + 8)
            return this.__pName
        }
    }

    /**
     * @type {SIZE}
     */
    Size{
        get {
            if(!this.HasProp("__Size"))
                this.__Size := SIZE(this.ptr + 16)
            return this.__Size
        }
    }

    /**
     * @type {RECTL}
     */
    ImageableArea{
        get {
            if(!this.HasProp("__ImageableArea"))
                this.__ImageableArea := RECTL(this.ptr + 24)
            return this.__ImageableArea
        }
    }

    /**
     * @type {PSTR}
     */
    pKeyword{
        get {
            if(!this.HasProp("__pKeyword"))
                this.__pKeyword := PSTR(this.ptr + 40)
            return this.__pKeyword
        }
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
    pMuiDll{
        get {
            if(!this.HasProp("__pMuiDll"))
                this.__pMuiDll := PSTR(this.ptr + 56)
            return this.__pMuiDll
        }
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
    pDisplayName{
        get {
            if(!this.HasProp("__pDisplayName"))
                this.__pDisplayName := PSTR(this.ptr + 72)
            return this.__pDisplayName
        }
    }

    /**
     * @type {Integer}
     */
    wLangId {
        get => NumGet(this, 80, "ushort")
        set => NumPut("ushort", value, this, 80)
    }
}
