#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\COORD.ahk" { COORD }

/**
 * See reference information about the CONSOLE_FONT_INFO structure, which contains the index and size for a console font.
 * @remarks
 * To obtain the size of the font, pass the font index to the [**GetConsoleFontSize**](getconsolefontsize.md) function.
 * @see https://learn.microsoft.com/windows/console/console-font-info-str
 * @namespace Windows.Win32.System.Console
 */
export default struct CONSOLE_FONT_INFO {
    #StructPack 4

    /**
     * The index of the font in the system's console font table.
     */
    nFont : UInt32

    /**
     * A [**COORD**](coord-str.md) structure that contains the width and height of each character in the font, in logical units. The **X** member contains the width, while the **Y** member contains the height.
     */
    dwFontSize : COORD

}
