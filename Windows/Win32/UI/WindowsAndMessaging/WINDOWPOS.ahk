#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the size and position of a window.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-windowpos
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class WINDOWPOS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window.
     * @type {Pointer<HWND>}
     */
    hwnd {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * The position of the window in Z order (front-to-back position). This member can be a handle to the window behind which this window is placed, or can be one of the special values listed with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setwindowpos">SetWindowPos</a> function.
     * @type {Pointer<HWND>}
     */
    hwndInsertAfter {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * The position of the left edge of the window.
     * @type {Integer}
     */
    x {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b>int</b>
     * 
     * The position of the top edge of the window.
     * @type {Integer}
     */
    y {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b>int</b>
     * 
     * The window width, in pixels.
     * @type {Integer}
     */
    cx {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>int</b>
     * 
     * The window height, in pixels.
     * @type {Integer}
     */
    cy {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Type: <b>UINT</b>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
