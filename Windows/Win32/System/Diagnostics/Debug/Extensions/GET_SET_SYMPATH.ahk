#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class GET_SET_SYMPATH extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    Args{
        get {
            if(!this.HasProp("__Args"))
                this.__Args := PSTR(this.ptr + 0)
            return this.__Args
        }
    }

    /**
     * @type {PSTR}
     */
    Result{
        get {
            if(!this.HasProp("__Result"))
                this.__Result := PSTR(this.ptr + 8)
            return this.__Result
        }
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
