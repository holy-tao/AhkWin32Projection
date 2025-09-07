#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CMINVOKECOMMANDINFOEX_REMOTE extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    fMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {HWND}
     */
    hwnd{
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(this.ptr + 8)
            return this.__hwnd
        }
    }

    /**
     * @type {PSTR}
     */
    lpVerbString{
        get {
            if(!this.HasProp("__lpVerbString"))
                this.__lpVerbString := PSTR(this.ptr + 16)
            return this.__lpVerbString
        }
    }

    /**
     * @type {PSTR}
     */
    lpParameters{
        get {
            if(!this.HasProp("__lpParameters"))
                this.__lpParameters := PSTR(this.ptr + 24)
            return this.__lpParameters
        }
    }

    /**
     * @type {PSTR}
     */
    lpDirectory{
        get {
            if(!this.HasProp("__lpDirectory"))
                this.__lpDirectory := PSTR(this.ptr + 32)
            return this.__lpDirectory
        }
    }

    /**
     * @type {Integer}
     */
    nShow {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwHotKey {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {PSTR}
     */
    lpTitle{
        get {
            if(!this.HasProp("__lpTitle"))
                this.__lpTitle := PSTR(this.ptr + 48)
            return this.__lpTitle
        }
    }

    /**
     * @type {PWSTR}
     */
    lpVerbWString{
        get {
            if(!this.HasProp("__lpVerbWString"))
                this.__lpVerbWString := PWSTR(this.ptr + 56)
            return this.__lpVerbWString
        }
    }

    /**
     * @type {PWSTR}
     */
    lpParametersW{
        get {
            if(!this.HasProp("__lpParametersW"))
                this.__lpParametersW := PWSTR(this.ptr + 64)
            return this.__lpParametersW
        }
    }

    /**
     * @type {PWSTR}
     */
    lpDirectoryW{
        get {
            if(!this.HasProp("__lpDirectoryW"))
                this.__lpDirectoryW := PWSTR(this.ptr + 72)
            return this.__lpDirectoryW
        }
    }

    /**
     * @type {PWSTR}
     */
    lpTitleW{
        get {
            if(!this.HasProp("__lpTitleW"))
                this.__lpTitleW := PWSTR(this.ptr + 80)
            return this.__lpTitleW
        }
    }

    /**
     * @type {POINT}
     */
    ptInvoke{
        get {
            if(!this.HasProp("__ptInvoke"))
                this.__ptInvoke := POINT(this.ptr + 88)
            return this.__ptInvoke
        }
    }

    /**
     * @type {Integer}
     */
    lpVerbInt {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    lpVerbWInt {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 104
    }
}
