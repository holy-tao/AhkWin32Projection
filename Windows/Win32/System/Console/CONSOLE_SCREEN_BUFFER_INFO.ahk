#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\COORD.ahk
#Include .\SMALL_RECT.ahk

/**
 * See reference information about the CONSOLE_SCREEN_BUFFER_INFO structure, which contains information about a console screen buffer.
 * @see https://learn.microsoft.com/windows/console/console-screen-buffer-info-str
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class CONSOLE_SCREEN_BUFFER_INFO extends Win32Struct
{
    static sizeof => 22

    static packingSize => 2

    /**
     * A [**COORD**](coord-str.md) structure that contains the size of the console screen buffer, in character columns and rows.
     * @type {COORD}
     */
    dwSize{
        get {
            if(!this.HasProp("__dwSize"))
                this.__dwSize := COORD(0, this)
            return this.__dwSize
        }
    }

    /**
     * A [**COORD**](coord-str.md) structure that contains the column and row coordinates of the cursor in the console screen buffer.
     * @type {COORD}
     */
    dwCursorPosition{
        get {
            if(!this.HasProp("__dwCursorPosition"))
                this.__dwCursorPosition := COORD(4, this)
            return this.__dwCursorPosition
        }
    }

    /**
     * The attributes of the characters written to a screen buffer by the [**WriteFile**](/windows/win32/api/fileapi/nf-fileapi-writefile) and [**WriteConsole**](writeconsole.md) functions, or echoed to a screen buffer by the [**ReadFile**](/windows/win32/api/fileapi/nf-fileapi-readfile) and [**ReadConsole**](readconsole.md) functions. For more information, see [Character Attributes](console-screen-buffers.md#character-attributes).
     * @type {Integer}
     */
    wAttributes {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * A [**SMALL\_RECT**](small-rect-str.md) structure that contains the console screen buffer coordinates of the upper-left and lower-right corners of the display window.
     * @type {SMALL_RECT}
     */
    srWindow{
        get {
            if(!this.HasProp("__srWindow"))
                this.__srWindow := SMALL_RECT(10, this)
            return this.__srWindow
        }
    }

    /**
     * A [**COORD**](coord-str.md) structure that contains the maximum size of the console window, in character columns and rows, given the current screen buffer size and font and the screen size.
     * @type {COORD}
     */
    dwMaximumWindowSize{
        get {
            if(!this.HasProp("__dwMaximumWindowSize"))
                this.__dwMaximumWindowSize := COORD(18, this)
            return this.__dwMaximumWindowSize
        }
    }
}
