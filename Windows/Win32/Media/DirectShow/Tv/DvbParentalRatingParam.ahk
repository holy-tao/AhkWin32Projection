#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class DvbParentalRatingParam extends Win32Struct
{
    static sizeof => 5

    static packingSize => 1

    /**
     * @type {Array<SByte>}
     */
    szCountryCode{
        get {
            if(!this.HasProp("__szCountryCodeProxyArray"))
                this.__szCountryCodeProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "char")
            return this.__szCountryCodeProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    bRating {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }
}
