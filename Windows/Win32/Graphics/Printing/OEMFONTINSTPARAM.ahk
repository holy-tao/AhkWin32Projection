#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

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
                this.__hPrinter := HANDLE(8, this)
            return this.__hPrinter
        }
    }

    /**
     * @type {HANDLE}
     */
    hModule{
        get {
            if(!this.HasProp("__hModule"))
                this.__hModule := HANDLE(16, this)
            return this.__hModule
        }
    }

    /**
     * @type {HANDLE}
     */
    hHeap{
        get {
            if(!this.HasProp("__hHeap"))
                this.__hHeap := HANDLE(24, this)
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
    pFontInstallerName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 48
    }
}
