#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_EXTENDED_HEADER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pwszName{
        get {
            if(!this.HasProp("__pwszName"))
                this.__pwszName := PWSTR(this.ptr + 0)
            return this.__pwszName
        }
    }

    /**
     * @type {PSTR}
     */
    pszName{
        get {
            if(!this.HasProp("__pszName"))
                this.__pszName := PSTR(this.ptr + 0)
            return this.__pszName
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszValue{
        get {
            if(!this.HasProp("__pwszValue"))
                this.__pwszValue := PWSTR(this.ptr + 8)
            return this.__pwszValue
        }
    }

    /**
     * @type {PSTR}
     */
    pszValue{
        get {
            if(!this.HasProp("__pszValue"))
                this.__pszValue := PSTR(this.ptr + 8)
            return this.__pszValue
        }
    }
}
