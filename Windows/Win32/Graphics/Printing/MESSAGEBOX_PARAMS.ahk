#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class MESSAGEBOX_PARAMS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pTitle{
        get {
            if(!this.HasProp("__pTitle"))
                this.__pTitle := PWSTR(this.ptr + 8)
            return this.__pTitle
        }
    }

    /**
     * @type {PWSTR}
     */
    pMessage{
        get {
            if(!this.HasProp("__pMessage"))
                this.__pMessage := PWSTR(this.ptr + 16)
            return this.__pMessage
        }
    }

    /**
     * @type {Integer}
     */
    Style {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwTimeout {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {BOOL}
     */
    bWait{
        get {
            if(!this.HasProp("__bWait"))
                this.__bWait := BOOL(this.ptr + 32)
            return this.__bWait
        }
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
