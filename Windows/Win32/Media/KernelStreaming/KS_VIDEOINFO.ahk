#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\KS_BITMAPINFOHEADER.ahk
#Include .\KS_RGBQUAD.ahk
#Include .\KS_TRUECOLORINFO.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_VIDEOINFO extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {RECT}
     */
    rcSource{
        get {
            if(!this.HasProp("__rcSource"))
                this.__rcSource := RECT(this.ptr + 0)
            return this.__rcSource
        }
    }

    /**
     * @type {RECT}
     */
    rcTarget{
        get {
            if(!this.HasProp("__rcTarget"))
                this.__rcTarget := RECT(this.ptr + 16)
            return this.__rcTarget
        }
    }

    /**
     * @type {Integer}
     */
    dwBitRate {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    dwBitErrorRate {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    AvgTimePerFrame {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * @type {KS_BITMAPINFOHEADER}
     */
    bmiHeader{
        get {
            if(!this.HasProp("__bmiHeader"))
                this.__bmiHeader := KS_BITMAPINFOHEADER(this.ptr + 48)
            return this.__bmiHeader
        }
    }

    /**
     * @type {Array<KS_RGBQUAD>}
     */
    bmiColors{
        get {
            if(!this.HasProp("__bmiColorsProxyArray"))
                this.__bmiColorsProxyArray := Win32FixedArray(this.ptr + 88, 8, KS_RGBQUAD, "")
            return this.__bmiColorsProxyArray
        }
    }

    /**
     * @type {Array<UInt32>}
     */
    dwBitMasks{
        get {
            if(!this.HasProp("__dwBitMasksProxyArray"))
                this.__dwBitMasksProxyArray := Win32FixedArray(this.ptr + 88, 4, Primitive, "uint")
            return this.__dwBitMasksProxyArray
        }
    }

    /**
     * @type {KS_TRUECOLORINFO}
     */
    TrueColorInfo{
        get {
            if(!this.HasProp("__TrueColorInfo"))
                this.__TrueColorInfo := KS_TRUECOLORINFO(this.ptr + 88)
            return this.__TrueColorInfo
        }
    }
}
