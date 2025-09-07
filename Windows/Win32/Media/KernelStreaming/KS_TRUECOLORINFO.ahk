#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KS_RGBQUAD.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_TRUECOLORINFO extends Win32Struct
{
    static sizeof => 2064

    static packingSize => 8

    /**
     * @type {Array<UInt32>}
     */
    dwBitMasks{
        get {
            if(!this.HasProp("__dwBitMasksProxyArray"))
                this.__dwBitMasksProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "uint")
            return this.__dwBitMasksProxyArray
        }
    }

    /**
     * @type {Array<KS_RGBQUAD>}
     */
    bmiColors{
        get {
            if(!this.HasProp("__bmiColorsProxyArray"))
                this.__bmiColorsProxyArray := Win32FixedArray(this.ptr + 16, 8, KS_RGBQUAD, "")
            return this.__bmiColorsProxyArray
        }
    }
}
