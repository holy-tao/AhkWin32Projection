#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\Foundation\BOOLEAN.ahk

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
    CopyOnOpen{
        get {
            if(!this.HasProp("__CopyOnOpen"))
                this.__CopyOnOpen := BOOLEAN(this.ptr + 8)
            return this.__CopyOnOpen
        }
    }

    /**
     * @type {BOOLEAN}
     */
    EffectiveOnly{
        get {
            if(!this.HasProp("__EffectiveOnly"))
                this.__EffectiveOnly := BOOLEAN(this.ptr + 9)
            return this.__EffectiveOnly
        }
    }

    /**
     * @type {Integer}
     */
    Level {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
