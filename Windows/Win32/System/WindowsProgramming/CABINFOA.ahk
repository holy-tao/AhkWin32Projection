#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 * @charset ANSI
 */
class CABINFOA extends Win32Struct
{
    static sizeof => 288

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    pszCab{
        get {
            if(!this.HasProp("__pszCab"))
                this.__pszCab := PSTR(this.ptr + 0)
            return this.__pszCab
        }
    }

    /**
     * @type {PSTR}
     */
    pszInf{
        get {
            if(!this.HasProp("__pszInf"))
                this.__pszInf := PSTR(this.ptr + 8)
            return this.__pszInf
        }
    }

    /**
     * @type {PSTR}
     */
    pszSection{
        get {
            if(!this.HasProp("__pszSection"))
                this.__pszSection := PSTR(this.ptr + 16)
            return this.__pszSection
        }
    }

    /**
     * @type {String}
     */
    szSrcPath {
        get => StrGet(this.ptr + 24, 259, "UTF-8")
        set => StrPut(value, this.ptr + 24, 259, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 284, "uint")
        set => NumPut("uint", value, this, 284)
    }
}
