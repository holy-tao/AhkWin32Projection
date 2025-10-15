#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class INTERNET_COOKIE extends Win32Struct
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
     * @type {PSTR}
     */
    pszName{
        get {
            if(!this.HasProp("__pszName"))
                this.__pszName := PSTR(this.ptr + 8)
            return this.__pszName
        }
    }

    /**
     * @type {PSTR}
     */
    pszData{
        get {
            if(!this.HasProp("__pszData"))
                this.__pszData := PSTR(this.ptr + 16)
            return this.__pszData
        }
    }

    /**
     * @type {PSTR}
     */
    pszDomain{
        get {
            if(!this.HasProp("__pszDomain"))
                this.__pszDomain := PSTR(this.ptr + 24)
            return this.__pszDomain
        }
    }

    /**
     * @type {PSTR}
     */
    pszPath{
        get {
            if(!this.HasProp("__pszPath"))
                this.__pszPath := PSTR(this.ptr + 32)
            return this.__pszPath
        }
    }

    /**
     * @type {Pointer<FILETIME>}
     */
    pftExpires {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {PSTR}
     */
    pszUrl{
        get {
            if(!this.HasProp("__pszUrl"))
                this.__pszUrl := PSTR(this.ptr + 56)
            return this.__pszUrl
        }
    }

    /**
     * @type {PSTR}
     */
    pszP3PPolicy{
        get {
            if(!this.HasProp("__pszP3PPolicy"))
                this.__pszP3PPolicy := PSTR(this.ptr + 64)
            return this.__pszP3PPolicy
        }
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
