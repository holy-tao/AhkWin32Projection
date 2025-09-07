#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SPWORDHANDLE.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPWORDENTRY extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {SPWORDHANDLE}
     */
    hWord{
        get {
            if(!this.HasProp("__hWord"))
                this.__hWord := SPWORDHANDLE(this.ptr + 0)
            return this.__hWord
        }
    }

    /**
     * @type {Integer}
     */
    LangID {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    pszDisplayText{
        get {
            if(!this.HasProp("__pszDisplayText"))
                this.__pszDisplayText := PWSTR(this.ptr + 16)
            return this.__pszDisplayText
        }
    }

    /**
     * @type {PWSTR}
     */
    pszLexicalForm{
        get {
            if(!this.HasProp("__pszLexicalForm"))
                this.__pszLexicalForm := PWSTR(this.ptr + 24)
            return this.__pszLexicalForm
        }
    }

    /**
     * @type {Pointer<UInt16>}
     */
    aPhoneId {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Void>}
     */
    pvClientContext {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
