#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPSHORTCUTPAIR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<SPSHORTCUTPAIR>}
     */
    pNextSHORTCUTPAIR {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    LangID {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    shType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {PWSTR}
     */
    pszDisplay{
        get {
            if(!this.HasProp("__pszDisplay"))
                this.__pszDisplay := PWSTR(this.ptr + 16)
            return this.__pszDisplay
        }
    }

    /**
     * @type {PWSTR}
     */
    pszSpoken{
        get {
            if(!this.HasProp("__pszSpoken"))
                this.__pszSpoken := PWSTR(this.ptr + 24)
            return this.__pszSpoken
        }
    }
}
