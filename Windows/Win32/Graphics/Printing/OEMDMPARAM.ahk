#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class OEMDMPARAM extends Win32Struct
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
     * @type {Pointer<Void>}
     */
    pdriverobj {
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
     * @type {HANDLE}
     */
    hModule{
        get {
            if(!this.HasProp("__hModule"))
                this.__hModule := HANDLE(this.ptr + 24)
            return this.__hModule
        }
    }

    /**
     * @type {Pointer<DEVMODEA>}
     */
    pPublicDMIn {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<DEVMODEA>}
     */
    pPublicDMOut {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Void>}
     */
    pOEMDMIn {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Void>}
     */
    pOEMDMOut {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    cbBufSize {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
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
