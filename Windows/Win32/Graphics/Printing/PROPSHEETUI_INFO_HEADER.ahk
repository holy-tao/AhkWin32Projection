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
     * @type {Pointer<SByte>}
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
                this.__hWndParent := HWND(this.ptr + 16)
            return this.__hWndParent
        }
    }

    /**
     * @type {HINSTANCE}
     */
    hInst{
        get {
            if(!this.HasProp("__hInst"))
                this.__hInst := HINSTANCE(this.ptr + 24)
            return this.__hInst
        }
    }

    /**
     * @type {HICON}
     */
    hIcon{
        get {
            if(!this.HasProp("__hIcon"))
                this.__hIcon := HICON(this.ptr + 32)
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

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 40
    }
}
