#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBLITERALINFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pwszLiteralValue{
        get {
            if(!this.HasProp("__pwszLiteralValue"))
                this.__pwszLiteralValue := PWSTR(this.ptr + 0)
            return this.__pwszLiteralValue
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszInvalidChars{
        get {
            if(!this.HasProp("__pwszInvalidChars"))
                this.__pwszInvalidChars := PWSTR(this.ptr + 8)
            return this.__pwszInvalidChars
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszInvalidStartingChars{
        get {
            if(!this.HasProp("__pwszInvalidStartingChars"))
                this.__pwszInvalidStartingChars := PWSTR(this.ptr + 16)
            return this.__pwszInvalidStartingChars
        }
    }

    /**
     * @type {Integer}
     */
    lt {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {BOOL}
     */
    fSupported{
        get {
            if(!this.HasProp("__fSupported"))
                this.__fSupported := BOOL(this.ptr + 28)
            return this.__fSupported
        }
    }

    /**
     * @type {Integer}
     */
    cchMaxLen {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
