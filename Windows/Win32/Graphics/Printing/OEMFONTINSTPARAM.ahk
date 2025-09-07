#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class OEMFONTINSTPARAM extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {HANDLE}
     */
    hPrinter{
        get {
            if(!this.HasProp("__hPrinter"))
                this.__hPrinter := HANDLE(this.ptr + 8)
            return this.__hPrinter
        }
    }

    /**
     * @type {HANDLE}
     */
    hModule{
        get {
            if(!this.HasProp("__hModule"))
                this.__hModule := HANDLE(this.ptr + 16)
            return this.__hModule
        }
    }

    /**
     * @type {HANDLE}
     */
    hHeap{
        get {
            if(!this.HasProp("__hHeap"))
                this.__hHeap := HANDLE(this.ptr + 24)
            return this.__hHeap
        }
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {PWSTR}
     */
    pFontInstallerName{
        get {
            if(!this.HasProp("__pFontInstallerName"))
                this.__pFontInstallerName := PWSTR(this.ptr + 40)
            return this.__pFontInstallerName
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 48
    }
}
