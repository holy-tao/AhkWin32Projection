#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class EXT_MATCH_PATTERN_A extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    Str{
        get {
            if(!this.HasProp("__Str"))
                this.__Str := PSTR(this.ptr + 0)
            return this.__Str
        }
    }

    /**
     * @type {PSTR}
     */
    Pattern{
        get {
            if(!this.HasProp("__Pattern"))
                this.__Pattern := PSTR(this.ptr + 8)
            return this.__Pattern
        }
    }

    /**
     * @type {Integer}
     */
    CaseSensitive {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
