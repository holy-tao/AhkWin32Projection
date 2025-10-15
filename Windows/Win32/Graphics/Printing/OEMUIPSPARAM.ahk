#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class OEMUIPSPARAM extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<OEMUIOBJ>}
     */
    poemuiobj {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {HANDLE}
     */
    hPrinter{
        get {
            if(!this.HasProp("__hPrinter"))
                this.__hPrinter := HANDLE(this.ptr + 16)
            return this.__hPrinter
        }
    }

    /**
     * @type {PWSTR}
     */
    pPrinterName{
        get {
            if(!this.HasProp("__pPrinterName"))
                this.__pPrinterName := PWSTR(this.ptr + 24)
            return this.__pPrinterName
        }
    }

    /**
     * @type {HANDLE}
     */
    hModule{
        get {
            if(!this.HasProp("__hModule"))
                this.__hModule := HANDLE(this.ptr + 32)
            return this.__hModule
        }
    }

    /**
     * @type {HANDLE}
     */
    hOEMHeap{
        get {
            if(!this.HasProp("__hOEMHeap"))
                this.__hOEMHeap := HANDLE(this.ptr + 40)
            return this.__hOEMHeap
        }
    }

    /**
     * @type {Pointer<DEVMODEA>}
     */
    pPublicDM {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Void>}
     */
    pOEMDM {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<Void>}
     */
    pOEMUserData {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Pointer<Void>}
     */
    pOemEntry {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 88
    }
}
