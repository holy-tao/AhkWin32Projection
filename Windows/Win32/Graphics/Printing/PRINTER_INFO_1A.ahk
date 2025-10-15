#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class PRINTER_INFO_1A extends Win32Struct
{
    static sizeof => 32

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
    pDescription{
        get {
            if(!this.HasProp("__pDescription"))
                this.__pDescription := PSTR(this.ptr + 8)
            return this.__pDescription
        }
    }

    /**
     * @type {PSTR}
     */
    pName{
        get {
            if(!this.HasProp("__pName"))
                this.__pName := PSTR(this.ptr + 16)
            return this.__pName
        }
    }

    /**
     * @type {PSTR}
     */
    pComment{
        get {
            if(!this.HasProp("__pComment"))
                this.__pComment := PSTR(this.ptr + 24)
            return this.__pComment
        }
    }
}
