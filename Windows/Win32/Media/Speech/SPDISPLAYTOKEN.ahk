#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPDISPLAYTOKEN extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pszLexical{
        get {
            if(!this.HasProp("__pszLexical"))
                this.__pszLexical := PWSTR(this.ptr + 0)
            return this.__pszLexical
        }
    }

    /**
     * @type {PWSTR}
     */
    pszDisplay{
        get {
            if(!this.HasProp("__pszDisplay"))
                this.__pszDisplay := PWSTR(this.ptr + 8)
            return this.__pszDisplay
        }
    }

    /**
     * @type {Integer}
     */
    bDisplayAttributes {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }
}
