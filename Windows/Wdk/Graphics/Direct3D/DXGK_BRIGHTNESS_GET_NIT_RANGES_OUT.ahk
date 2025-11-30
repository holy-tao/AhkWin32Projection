#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXGK_BRIGHTNESS_NIT_RANGE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGK_BRIGHTNESS_GET_NIT_RANGES_OUT extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NormalRangeCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    RangeCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    PreferredMaximumBrightness {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<DXGK_BRIGHTNESS_NIT_RANGE>}
     */
    SupportedRanges{
        get {
            if(!this.HasProp("__SupportedRangesProxyArray"))
                this.__SupportedRangesProxyArray := Win32FixedArray(this.ptr + 16, 16, Primitive, "ptr")
            return this.__SupportedRangesProxyArray
        }
    }
}
