#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\HINSTANCE.ahk
#Include ..\..\UI\WindowsAndMessaging\HICON.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PROPSHEETUI_INFO_HEADER extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pTitle {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {HWND}
     */
    hWndParent{
        get {
            if(!this.HasProp("__hWndParent"))
                this.__hWndParent := HWND(16, this)
            return this.__hWndParent
        }
    }

    /**
     * @type {HINSTANCE}
     */
    hInst{
        get {
            if(!this.HasProp("__hInst"))
                this.__hInst := HINSTANCE(24, this)
            return this.__hInst
        }
    }

    /**
     * @type {HICON}
     */
    hIcon{
        get {
            if(!this.HasProp("__hIcon"))
                this.__hIcon := HICON(32, this)
            return this.__hIcon
        }
    }

    /**
     * @type {Pointer}
     */
    IconID {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 40
    }
}
