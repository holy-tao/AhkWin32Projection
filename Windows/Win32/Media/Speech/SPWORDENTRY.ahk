#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SPWORDHANDLE.ahk

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
                this.__hWord := SPWORDHANDLE(0, this)
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
    pszDisplayText {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {PWSTR}
     */
    pszLexicalForm {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Integer>}
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
