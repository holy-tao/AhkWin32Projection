#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\HINSTANCE.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\LPARAM.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset ANSI
 */
class TTTOOLINFOA extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    uFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
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
     * @type {Pointer}
     */
    uId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {RECT}
     */
    rect{
        get {
            if(!this.HasProp("__rect"))
                this.__rect := RECT(this.ptr + 24)
            return this.__rect
        }
    }

    /**
     * @type {HINSTANCE}
     */
    hinst{
        get {
            if(!this.HasProp("__hinst"))
                this.__hinst := HINSTANCE(this.ptr + 40)
            return this.__hinst
        }
    }

    /**
     * @type {PSTR}
     */
    lpszText{
        get {
            if(!this.HasProp("__lpszText"))
                this.__lpszText := PSTR(this.ptr + 48)
            return this.__lpszText
        }
    }

    /**
     * @type {LPARAM}
     */
    lParam{
        get {
            if(!this.HasProp("__lParam"))
                this.__lParam := LPARAM(this.ptr + 56)
            return this.__lParam
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    lpReserved {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 72
    }
}
