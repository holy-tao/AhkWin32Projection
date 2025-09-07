#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * Contains the flash status for a window and the number of times the system should flash the window.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-flashwinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class FLASHWINFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A handle to the window to be flashed. The window can be either opened or minimized.
     * @type {HWND}
     */
    hwnd{
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(this.ptr + 8)
            return this.__hwnd
        }
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of times to flash the window.
     * @type {Integer}
     */
    uCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The rate at which the window is to be flashed, in milliseconds. If <b>dwTimeout</b> is zero, the function uses the default cursor blink rate.
     * @type {Integer}
     */
    dwTimeout {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 32
    }
}
