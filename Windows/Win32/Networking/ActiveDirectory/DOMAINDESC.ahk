#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DOMAINDESC extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pszName{
        get {
            if(!this.HasProp("__pszName"))
                this.__pszName := PWSTR(this.ptr + 0)
            return this.__pszName
        }
    }

    /**
     * @type {PWSTR}
     */
    pszPath{
        get {
            if(!this.HasProp("__pszPath"))
                this.__pszPath := PWSTR(this.ptr + 8)
            return this.__pszPath
        }
    }

    /**
     * @type {PWSTR}
     */
    pszNCName{
        get {
            if(!this.HasProp("__pszNCName"))
                this.__pszNCName := PWSTR(this.ptr + 16)
            return this.__pszNCName
        }
    }

    /**
     * @type {PWSTR}
     */
    pszTrustParent{
        get {
            if(!this.HasProp("__pszTrustParent"))
                this.__pszTrustParent := PWSTR(this.ptr + 24)
            return this.__pszTrustParent
        }
    }

    /**
     * @type {PWSTR}
     */
    pszObjectClass{
        get {
            if(!this.HasProp("__pszObjectClass"))
                this.__pszObjectClass := PWSTR(this.ptr + 32)
            return this.__pszObjectClass
        }
    }

    /**
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {BOOL}
     */
    fDownLevel{
        get {
            if(!this.HasProp("__fDownLevel"))
                this.__fDownLevel := BOOL(this.ptr + 44)
            return this.__fDownLevel
        }
    }

    /**
     * @type {Pointer<DOMAINDESC>}
     */
    pdChildList {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<DOMAINDESC>}
     */
    pdNextSibling {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
