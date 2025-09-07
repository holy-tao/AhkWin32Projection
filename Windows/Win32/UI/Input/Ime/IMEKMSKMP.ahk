#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\HIMC.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IMEKMSKMP extends Win32Struct
{
    static sizeof => 30

    static packingSize => 1

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
                this.__hIMC := HIMC(this.ptr + 4)
            return this.__hIMC
        }
    }

    /**
     * @type {Integer}
     */
    idLang {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    wVKStart {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    wVKEnd {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    cKeyList {
        get => NumGet(this, 18, "int")
        set => NumPut("int", value, this, 18)
    }

    /**
     * @type {Pointer<IMEKMSKEY>}
     */
    pKeyList {
        get => NumGet(this, 22, "ptr")
        set => NumPut("ptr", value, this, 22)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 30
    }
}
