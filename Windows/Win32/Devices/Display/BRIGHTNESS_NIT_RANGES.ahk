#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BRIGHTNESS_NIT_RANGE.ahk" { BRIGHTNESS_NIT_RANGE }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct BRIGHTNESS_NIT_RANGES {
    #StructPack 4

    NormalRangeCount : UInt32

    RangeCount : UInt32

    PreferredMaximumBrightness : UInt32

    SupportedRanges : BRIGHTNESS_NIT_RANGE[16]

}
