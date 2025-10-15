#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SIGNER_ATTR_AUTHCODE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    fCommercial{
        get {
            if(!this.HasProp("__fCommercial"))
                this.__fCommercial := BOOL(this.ptr + 4)
            return this.__fCommercial
        }
    }

    /**
     * @type {BOOL}
     */
    fIndividual{
        get {
            if(!this.HasProp("__fIndividual"))
                this.__fIndividual := BOOL(this.ptr + 8)
            return this.__fIndividual
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszName{
        get {
            if(!this.HasProp("__pwszName"))
                this.__pwszName := PWSTR(this.ptr + 16)
            return this.__pwszName
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszInfo{
        get {
            if(!this.HasProp("__pwszInfo"))
                this.__pwszInfo := PWSTR(this.ptr + 24)
            return this.__pwszInfo
        }
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
