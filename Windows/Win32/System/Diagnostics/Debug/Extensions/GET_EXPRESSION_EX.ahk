#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class GET_EXPRESSION_EX extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    Expression{
        get {
            if(!this.HasProp("__Expression"))
                this.__Expression := PSTR(this.ptr + 0)
            return this.__Expression
        }
    }

    /**
     * @type {PSTR}
     */
    Remainder{
        get {
            if(!this.HasProp("__Remainder"))
                this.__Remainder := PSTR(this.ptr + 8)
            return this.__Remainder
        }
    }

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
