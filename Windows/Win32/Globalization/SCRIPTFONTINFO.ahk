#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class SCRIPTFONTINFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    scripts {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {String}
     */
    wszFont {
        get => StrGet(this.ptr + 8, 31, "UTF-16")
        set => StrPut(value, this.ptr + 8, 31, "UTF-16")
    }
}
