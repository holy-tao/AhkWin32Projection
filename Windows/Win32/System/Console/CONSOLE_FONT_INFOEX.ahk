#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\COORD.ahk

/**
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class CONSOLE_FONT_INFOEX extends Win32Struct
{
    static sizeof => 84

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    nFont {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {COORD}
     */
    dwFontSize{
        get {
            if(!this.HasProp("__dwFontSize"))
                this.__dwFontSize := COORD(this.ptr + 8)
            return this.__dwFontSize
        }
    }

    /**
     * @type {Integer}
     */
    FontFamily {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    FontWeight {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {String}
     */
    FaceName {
        get => StrGet(this.ptr + 20, 31, "UTF-16")
        set => StrPut(value, this.ptr + 20, 31, "UTF-16")
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 84
    }
}
