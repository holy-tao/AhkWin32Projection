#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PSPINFO extends Win32Struct
{
    static sizeof => 32

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
    wReserved {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {HANDLE}
     */
    hComPropSheet{
        get {
            if(!this.HasProp("__hComPropSheet"))
                this.__hComPropSheet := HANDLE(this.ptr + 8)
            return this.__hComPropSheet
        }
    }

    /**
     * @type {HANDLE}
     */
    hCPSUIPage{
        get {
            if(!this.HasProp("__hCPSUIPage"))
                this.__hCPSUIPage := HANDLE(this.ptr + 16)
            return this.__hCPSUIPage
        }
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnComPropSheet {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
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
