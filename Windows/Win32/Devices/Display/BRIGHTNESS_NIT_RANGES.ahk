#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BRIGHTNESS_NIT_RANGE.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class BRIGHTNESS_NIT_RANGES extends Win32Struct
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
     * @type {Array<BRIGHTNESS_NIT_RANGE>}
     */
    SupportedRanges{
        get {
            if(!this.HasProp("__SupportedRangesProxyArray"))
                this.__SupportedRangesProxyArray := Win32FixedArray(this.ptr + 16, 8, BRIGHTNESS_NIT_RANGE, "")
            return this.__SupportedRangesProxyArray
        }
    }
}
