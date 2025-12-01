#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\COORD.ahk
#Include .\SMALL_RECT.ahk

/**
 * See reference information about the CONSOLE_SCREEN_BUFFER_INFOEX structure, which contains extended information about a console screen buffer.
 * @see https://learn.microsoft.com/windows/console/console-screen-buffer-infoex
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class CONSOLE_SCREEN_BUFFER_INFOEX extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * The size of this structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A [**COORD**](coord-str.md) structure that contains the size of the console screen buffer, in character columns and rows.
     * @type {COORD}
     */
    dwSize{
        get {
            if(!this.HasProp("__dwSize"))
                this.__dwSize := COORD(4, this)
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
                this.__dwCursorPosition := COORD(8, this)
            return this.__dwCursorPosition
        }
    }

    /**
     * The attributes of the characters written to a screen buffer by the [**WriteFile**](/windows/win32/api/fileapi/nf-fileapi-writefile) and [**WriteConsole**](writeconsole.md) functions, or echoed to a screen buffer by the [**ReadFile**](/windows/win32/api/fileapi/nf-fileapi-readfile) and [**ReadConsole**](readconsole.md) functions. For more information, see [Character Attributes](console-screen-buffers.md#character-attributes).
     * @type {Integer}
     */
    wAttributes {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * A [**SMALL\_RECT**](small-rect-str.md) structure that contains the console screen buffer coordinates of the upper-left and lower-right corners of the display window.
     * @type {SMALL_RECT}
     */
    srWindow{
        get {
            if(!this.HasProp("__srWindow"))
                this.__srWindow := SMALL_RECT(16, this)
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
                this.__dwMaximumWindowSize := COORD(24, this)
            return this.__dwMaximumWindowSize
        }
    }

    /**
     * The fill attribute for console pop-ups.
     * @type {Integer}
     */
    wPopupAttributes {
        get => NumGet(this, 28, "ushort")
        set => NumPut("ushort", value, this, 28)
    }

    /**
     * If this member is `TRUE`, full-screen mode is supported; otherwise, it is not. This will always be `FALSE` for systems after Windows Vista with the [WDDM driver model](/windows-hardware/drivers/display/introduction-to-the-windows-vista-and-later-display-driver-model) as true direct VGA access to the monitor is no longer available.
     * @type {BOOL}
     */
    bFullscreenSupported {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * An array of [**COLORREF**](/windows/win32/gdi/colorref) values that describe the console's color settings.
     * @type {Array<COLORREF>}
     */
    ColorTable{
        get {
            if(!this.HasProp("__ColorTableProxyArray"))
                this.__ColorTableProxyArray := Win32FixedArray(this.ptr + 36, 16, Primitive, "uint")
            return this.__ColorTableProxyArray
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 104
    }
}
