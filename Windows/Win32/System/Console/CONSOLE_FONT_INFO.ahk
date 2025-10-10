#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\COORD.ahk

/**
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class CONSOLE_FONT_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    nFont {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {COORD}
     */
    dwFontSize{
        get {
            if(!this.HasProp("__dwFontSize"))
                this.__dwFontSize := COORD(this.ptr + 4)
            return this.__dwFontSize
        }
    }
}
