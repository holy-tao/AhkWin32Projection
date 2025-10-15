#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\CHAR.ahk

/**
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class CHAR_INFO extends Win32Struct
{
    static sizeof => 6

    static packingSize => 3

    /**
     * @type {Integer}
     */
    UnicodeChar {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {CHAR}
     */
    AsciiChar{
        get {
            if(!this.HasProp("__AsciiChar"))
                this.__AsciiChar := CHAR(this.ptr + 0)
            return this.__AsciiChar
        }
    }

    /**
     * @type {Integer}
     */
    Attributes {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }
}
