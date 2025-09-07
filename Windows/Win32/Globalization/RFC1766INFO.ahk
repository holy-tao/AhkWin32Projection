#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class RFC1766INFO extends Win32Struct
{
    static sizeof => 80

    static packingSize => 4

    /**
     * @type {Integer}
     */
    lcid {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {String}
     */
    wszRfc1766 {
        get => StrGet(this.ptr + 4, 5, "UTF-16")
        set => StrPut(value, this.ptr + 4, 5, "UTF-16")
    }

    /**
     * @type {String}
     */
    wszLocaleName {
        get => StrGet(this.ptr + 16, 31, "UTF-16")
        set => StrPut(value, this.ptr + 16, 31, "UTF-16")
    }
}
