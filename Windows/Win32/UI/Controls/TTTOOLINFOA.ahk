#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\HINSTANCE.ahk

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
                this.__hwnd := HWND(8, this)
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
                this.__rect := RECT(24, this)
            return this.__rect
        }
    }

    /**
     * @type {HINSTANCE}
     */
    hinst{
        get {
            if(!this.HasProp("__hinst"))
                this.__hinst := HINSTANCE(40, this)
            return this.__hinst
        }
    }

    /**
     * @type {PSTR}
     */
    lpszText {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {LPARAM}
     */
    lParam {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpReserved {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 72
    }
}
