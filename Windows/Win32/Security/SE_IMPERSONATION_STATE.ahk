#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class SE_IMPERSONATION_STATE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    Token {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    CopyOnOpen {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {BOOLEAN}
     */
    EffectiveOnly {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {Integer}
     */
    Level {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
