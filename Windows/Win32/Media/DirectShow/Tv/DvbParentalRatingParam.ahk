#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class DvbParentalRatingParam extends Win32Struct
{
    static sizeof => 10

    static packingSize => 2

    /**
     * @type {String}
     */
    szCountryCode {
        get => StrGet(this.ptr + 0, 3, "UTF-16")
        set => StrPut(value, this.ptr + 0, 3, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    bRating {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }
}
