#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\COORD.ahk

/**
 * See reference information about the CONSOLE_FONT_INFO structure, which contains the index and size for a console font.
 * @remarks
 * To obtain the size of the font, pass the font index to the [**GetConsoleFontSize**](getconsolefontsize.md) function.
 * @see https://learn.microsoft.com/windows/console/console-font-info-str
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class CONSOLE_FONT_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The index of the font in the system's console font table.
     * @type {Integer}
     */
    nFont {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A [**COORD**](coord-str.md) structure that contains the width and height of each character in the font, in logical units. The **X** member contains the width, while the **Y** member contains the height.
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
