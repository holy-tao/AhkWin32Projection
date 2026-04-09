#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KS_RGBQUAD.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_TRUECOLORINFO extends Win32Struct {
    static sizeof => 1036

    static packingSize => 4

    /**
     * @type {Array<Integer>}
     */
    dwBitMasks {
        get {
            if(!this.HasProp("__dwBitMasksProxyArray"))
                this.__dwBitMasksProxyArray := Win32FixedArray(this.ptr + 0, 3, Primitive, "uint")
            return this.__dwBitMasksProxyArray
        }
    }

    /**
     * @type {KS_RGBQUAD}
     */
    bmiColors {
        get {
            if(!this.HasProp("__bmiColorsProxyArray"))
                this.__bmiColorsProxyArray := Win32FixedArray(this.ptr + 12, 256, KS_RGBQUAD, "")
            return this.__bmiColorsProxyArray
        }
    }
}
