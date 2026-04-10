#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class DvbParentalRatingParam extends Win32Struct {
    static sizeof => 6

    static packingSize => 2

    /**
     * @type {String}
     */
    szCountryCode {
        get => StrGet(this.ptr + 0, 3, "UTF-8")
        set => StrPut(value, this.ptr + 0, 3, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    bRating {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }
}
