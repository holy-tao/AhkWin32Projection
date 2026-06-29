#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SPSHORTCUTTYPE.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\SPSHORTCUTPAIR.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class SPSHORTCUTPAIR extends Win32Struct {
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
     * @type {SPSHORTCUTTYPE}
     */
    shType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {PWSTR}
     */
    pszDisplay {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {PWSTR}
     */
    pszSpoken {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
