#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 * @charset Unicode
 */
class CABINFOW extends Win32Struct
{
    static sizeof => 552

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pszCab{
        get {
            if(!this.HasProp("__pszCab"))
                this.__pszCab := PWSTR(this.ptr + 0)
            return this.__pszCab
        }
    }

    /**
     * @type {PWSTR}
     */
    pszInf{
        get {
            if(!this.HasProp("__pszInf"))
                this.__pszInf := PWSTR(this.ptr + 8)
            return this.__pszInf
        }
    }

    /**
     * @type {PWSTR}
     */
    pszSection{
        get {
            if(!this.HasProp("__pszSection"))
                this.__pszSection := PWSTR(this.ptr + 16)
            return this.__pszSection
        }
    }

    /**
     * @type {String}
     */
    szSrcPath {
        get => StrGet(this.ptr + 24, 259, "UTF-16")
        set => StrPut(value, this.ptr + 24, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 544, "uint")
        set => NumPut("uint", value, this, 544)
    }
}
