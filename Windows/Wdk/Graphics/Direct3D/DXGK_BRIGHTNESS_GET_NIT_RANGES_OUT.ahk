#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_BRIGHTNESS_GET_NIT_RANGES_OUT {
    #StructPack 8

    NormalRangeCount : UInt32

    RangeCount : UInt32

    PreferredMaximumBrightness : UInt32

    SupportedRanges : IntPtr[16]

}
