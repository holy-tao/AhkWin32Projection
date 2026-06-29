#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import ".\COORD.ahk" { COORD }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CONSOLE_CHARACTER_ATTRIBUTES.ahk" { CONSOLE_CHARACTER_ATTRIBUTES }
#Import ".\SMALL_RECT.ahk" { SMALL_RECT }

/**
 * See reference information about the CONSOLE_SCREEN_BUFFER_INFOEX structure, which contains extended information about a console screen buffer.
 * @see https://learn.microsoft.com/windows/console/console-screen-buffer-infoex
 * @namespace Windows.Win32.System.Console
 */
export default struct CONSOLE_SCREEN_BUFFER_INFOEX {
    #StructPack 4

    /**
     * The size of this structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * A [**COORD**](coord-str.md) structure that contains the size of the console screen buffer, in character columns and rows.
     */
    dwSize : COORD

    /**
     * A [**COORD**](coord-str.md) structure that contains the column and row coordinates of the cursor in the console screen buffer.
     */
    dwCursorPosition : COORD

    /**
     * The attributes of the characters written to a screen buffer by the [**WriteFile**](/windows/win32/api/fileapi/nf-fileapi-writefile) and [**WriteConsole**](writeconsole.md) functions, or echoed to a screen buffer by the [**ReadFile**](/windows/win32/api/fileapi/nf-fileapi-readfile) and [**ReadConsole**](readconsole.md) functions. For more information, see [Character Attributes](console-screen-buffers.md#character-attributes).
     */
    wAttributes : CONSOLE_CHARACTER_ATTRIBUTES

    /**
     * A [**SMALL\_RECT**](small-rect-str.md) structure that contains the console screen buffer coordinates of the upper-left and lower-right corners of the display window.
     */
    srWindow : SMALL_RECT

    /**
     * A [**COORD**](coord-str.md) structure that contains the maximum size of the console window, in character columns and rows, given the current screen buffer size and font and the screen size.
     */
    dwMaximumWindowSize : COORD

    /**
     * The fill attribute for console pop-ups.
     */
    wPopupAttributes : UInt16

    /**
     * If this member is `TRUE`, full-screen mode is supported; otherwise, it is not. This will always be `FALSE` for systems after Windows Vista with the [WDDM driver model](/windows-hardware/drivers/display/introduction-to-the-windows-vista-and-later-display-driver-model) as true direct VGA access to the monitor is no longer available.
     */
    bFullscreenSupported : BOOL

    /**
     * An array of [**COLORREF**](/windows/win32/gdi/colorref) values that describe the console's color settings.
     */
    ColorTable : COLORREF[16]

}
