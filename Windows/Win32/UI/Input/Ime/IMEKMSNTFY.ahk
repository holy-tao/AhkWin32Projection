#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\HIMC.ahk
#Include ..\..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IMEKMSNTFY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {HIMC}
     */
    hIMC{
        get {
            if(!this.HasProp("__hIMC"))
                this.__hIMC := HIMC(this.ptr + 8)
            return this.__hIMC
        }
    }

    /**
     * @type {BOOL}
     */
    fSelect{
        get {
            if(!this.HasProp("__fSelect"))
                this.__fSelect := BOOL(this.ptr + 16)
            return this.__fSelect
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 24
    }
}
