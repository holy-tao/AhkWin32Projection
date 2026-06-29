#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\COORD.ahk" { COORD }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * See reference information about the CONSOLE_FONT_INFOEX structure, which contains extended information for a console font.
 * @remarks
 * To obtain the size of the font, pass the font index to the [**GetConsoleFontSize**](getconsolefontsize.md) function.
 * @see https://learn.microsoft.com/windows/console/console-font-infoex
 * @namespace Windows.Win32.System.Console
 */
export default struct CONSOLE_FONT_INFOEX {
    #StructPack 4

    /**
     * The size of this structure, in bytes. This member must be set to `sizeof(CONSOLE_FONT_INFOEX)` before calling [**GetCurrentConsoleFontEx**](getcurrentconsolefontex.md) or it will fail.
     */
    cbSize : UInt32 := this.Size

    /**
     * The index of the font in the system's console font table.
     */
    nFont : UInt32

    /**
     * A [**COORD**](coord-str.md) structure that contains the width and height of each character in the font, in logical units. The **X** member contains the width, while the **Y** member contains the height.
     */
    dwFontSize : COORD

    /**
     * The font pitch and family. For information about the possible values for this member, see the description of the **tmPitchAndFamily** member of the [**TEXTMETRIC**](/windows/win32/api/wingdi/ns-wingdi-textmetrica) structure.
     */
    FontFamily : UInt32

    /**
     * The font weight. The weight can range from 100 to 1000, in multiples of 100. For example, the normal weight is 400, while 700 is bold.
     */
    FontWeight : UInt32

    /**
     * The name of the typeface (such as Courier or Arial).
     */
    FaceName : WCHAR[32]

}
