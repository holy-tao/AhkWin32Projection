#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\COORD.ahk

/**
 * See reference information about the CONSOLE_FONT_INFOEX structure, which contains extended information for a console font.
 * @remarks
 * To obtain the size of the font, pass the font index to the [**GetConsoleFontSize**](getconsolefontsize.md) function.
 * @see https://learn.microsoft.com/windows/console/console-font-infoex
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class CONSOLE_FONT_INFOEX extends Win32Struct
{
    static sizeof => 84

    static packingSize => 4

    /**
     * The size of this structure, in bytes. This member must be set to `sizeof(CONSOLE_FONT_INFOEX)` before calling [**GetCurrentConsoleFontEx**](getcurrentconsolefontex.md) or it will fail.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The index of the font in the system's console font table.
     * @type {Integer}
     */
    nFont {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A [**COORD**](coord-str.md) structure that contains the width and height of each character in the font, in logical units. The **X** member contains the width, while the **Y** member contains the height.
     * @type {COORD}
     */
    dwFontSize{
        get {
            if(!this.HasProp("__dwFontSize"))
                this.__dwFontSize := COORD(8, this)
            return this.__dwFontSize
        }
    }

    /**
     * The font pitch and family. For information about the possible values for this member, see the description of the **tmPitchAndFamily** member of the [**TEXTMETRIC**](/windows/win32/api/wingdi/ns-wingdi-textmetrica) structure.
     * @type {Integer}
     */
    FontFamily {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The font weight. The weight can range from 100 to 1000, in multiples of 100. For example, the normal weight is 400, while 700 is bold.
     * @type {Integer}
     */
    FontWeight {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The name of the typeface (such as Courier or Arial).
     * @type {String}
     */
    FaceName {
        get => StrGet(this.ptr + 20, 31, "UTF-16")
        set => StrPut(value, this.ptr + 20, 31, "UTF-16")
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 84
    }
}
