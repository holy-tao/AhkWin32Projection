#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DvbParentalRatingParam.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class DvbParentalRatingDescriptor extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ulNumParams {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<DvbParentalRatingParam>}
     */
    pParams{
        get {
            if(!this.HasProp("__pParamsProxyArray"))
                this.__pParamsProxyArray := Win32FixedArray(this.ptr + 8, 1, DvbParentalRatingParam, "")
            return this.__pParamsProxyArray
        }
    }
}
