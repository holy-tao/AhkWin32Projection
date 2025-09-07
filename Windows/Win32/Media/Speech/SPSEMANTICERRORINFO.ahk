#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPSEMANTICERRORINFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ulLineNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pszScriptLine{
        get {
            if(!this.HasProp("__pszScriptLine"))
                this.__pszScriptLine := PWSTR(this.ptr + 8)
            return this.__pszScriptLine
        }
    }

    /**
     * @type {PWSTR}
     */
    pszSource{
        get {
            if(!this.HasProp("__pszSource"))
                this.__pszSource := PWSTR(this.ptr + 16)
            return this.__pszSource
        }
    }

    /**
     * @type {PWSTR}
     */
    pszDescription{
        get {
            if(!this.HasProp("__pszDescription"))
                this.__pszDescription := PWSTR(this.ptr + 24)
            return this.__pszDescription
        }
    }

    /**
     * @type {Integer}
     */
    hrResultCode {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
