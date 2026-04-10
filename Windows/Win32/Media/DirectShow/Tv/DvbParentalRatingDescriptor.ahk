#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DvbParentalRatingParam.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class DvbParentalRatingDescriptor extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ulNumParams {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {DvbParentalRatingParam}
     */
    pParams {
        get {
            if(!this.HasProp("__pParamsProxyArray"))
                this.__pParamsProxyArray := Win32FixedArray(this.ptr + 4, 1, DvbParentalRatingParam, "")
            return this.__pParamsProxyArray
        }
    }
}
