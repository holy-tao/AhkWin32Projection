#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\HIMC.ahk
#Include ..\..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
class IMEKMSNTFY extends Win32Struct {
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
    hIMC {
        get {
            if(!this.HasProp("__hIMC"))
                this.__hIMC := HIMC(8, this)
            return this.__hIMC
        }
    }

    /**
     * @type {BOOL}
     */
    fSelect {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 24
    }
}
