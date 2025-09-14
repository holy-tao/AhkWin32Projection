#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class STATURL extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    pwcsUrl {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    pwcsTitle {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {FILETIME}
     */
    ftLastVisited{
        get {
            if(!this.HasProp("__ftLastVisited"))
                this.__ftLastVisited := FILETIME(this.ptr + 24)
            return this.__ftLastVisited
        }
    }

    /**
     * @type {FILETIME}
     */
    ftLastUpdated{
        get {
            if(!this.HasProp("__ftLastUpdated"))
                this.__ftLastUpdated := FILETIME(this.ptr + 32)
            return this.__ftLastUpdated
        }
    }

    /**
     * @type {FILETIME}
     */
    ftExpires{
        get {
            if(!this.HasProp("__ftExpires"))
                this.__ftExpires := FILETIME(this.ptr + 40)
            return this.__ftExpires
        }
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 56
    }
}
