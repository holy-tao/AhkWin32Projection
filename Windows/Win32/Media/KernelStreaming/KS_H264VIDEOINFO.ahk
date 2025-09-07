#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_H264VIDEOINFO extends Win32Struct
{
    static sizeof => 84

    static packingSize => 4

    /**
     * @type {Integer}
     */
    wWidth {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    wHeight {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    wSARwidth {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    wSARheight {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    wProfile {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    bLevelIDC {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    wConstrainedToolset {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    bmSupportedUsages {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    bmCapabilities {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    bmSVCCapabilities {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    bmMVCCapabilities {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    dwFrameInterval {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    bMaxCodecConfigDelay {
        get => NumGet(this, 36, "char")
        set => NumPut("char", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    bmSupportedSliceModes {
        get => NumGet(this, 37, "char")
        set => NumPut("char", value, this, 37)
    }

    /**
     * @type {Integer}
     */
    bmSupportedSyncFrameTypes {
        get => NumGet(this, 38, "char")
        set => NumPut("char", value, this, 38)
    }

    /**
     * @type {Integer}
     */
    bResolutionScaling {
        get => NumGet(this, 39, "char")
        set => NumPut("char", value, this, 39)
    }

    /**
     * @type {Integer}
     */
    bSimulcastSupport {
        get => NumGet(this, 40, "char")
        set => NumPut("char", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    bmSupportedRateControlModes {
        get => NumGet(this, 41, "char")
        set => NumPut("char", value, this, 41)
    }

    /**
     * @type {Integer}
     */
    wMaxMBperSecOneResolutionNoScalability {
        get => NumGet(this, 42, "ushort")
        set => NumPut("ushort", value, this, 42)
    }

    /**
     * @type {Integer}
     */
    wMaxMBperSecTwoResolutionsNoScalability {
        get => NumGet(this, 44, "ushort")
        set => NumPut("ushort", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    wMaxMBperSecThreeResolutionsNoScalability {
        get => NumGet(this, 46, "ushort")
        set => NumPut("ushort", value, this, 46)
    }

    /**
     * @type {Integer}
     */
    wMaxMBperSecFourResolutionsNoScalability {
        get => NumGet(this, 48, "ushort")
        set => NumPut("ushort", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    wMaxMBperSecOneResolutionTemporalScalability {
        get => NumGet(this, 50, "ushort")
        set => NumPut("ushort", value, this, 50)
    }

    /**
     * @type {Integer}
     */
    wMaxMBperSecTwoResolutionsTemporalScalablility {
        get => NumGet(this, 52, "ushort")
        set => NumPut("ushort", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    wMaxMBperSecThreeResolutionsTemporalScalability {
        get => NumGet(this, 54, "ushort")
        set => NumPut("ushort", value, this, 54)
    }

    /**
     * @type {Integer}
     */
    wMaxMBperSecFourResolutionsTemporalScalability {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    wMaxMBperSecOneResolutionTemporalQualityScalability {
        get => NumGet(this, 58, "ushort")
        set => NumPut("ushort", value, this, 58)
    }

    /**
     * @type {Integer}
     */
    wMaxMBperSecTwoResolutionsTemporalQualityScalability {
        get => NumGet(this, 60, "ushort")
        set => NumPut("ushort", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    wMaxMBperSecThreeResolutionsTemporalQualityScalablity {
        get => NumGet(this, 62, "ushort")
        set => NumPut("ushort", value, this, 62)
    }

    /**
     * @type {Integer}
     */
    wMaxMBperSecFourResolutionsTemporalQualityScalability {
        get => NumGet(this, 64, "ushort")
        set => NumPut("ushort", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    wMaxMBperSecOneResolutionTemporalSpatialScalability {
        get => NumGet(this, 66, "ushort")
        set => NumPut("ushort", value, this, 66)
    }

    /**
     * @type {Integer}
     */
    wMaxMBperSecTwoResolutionsTemporalSpatialScalability {
        get => NumGet(this, 68, "ushort")
        set => NumPut("ushort", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    wMaxMBperSecThreeResolutionsTemporalSpatialScalablity {
        get => NumGet(this, 70, "ushort")
        set => NumPut("ushort", value, this, 70)
    }

    /**
     * @type {Integer}
     */
    wMaxMBperSecFourResolutionsTemporalSpatialScalability {
        get => NumGet(this, 72, "ushort")
        set => NumPut("ushort", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    wMaxMBperSecOneResolutionFullScalability {
        get => NumGet(this, 74, "ushort")
        set => NumPut("ushort", value, this, 74)
    }

    /**
     * @type {Integer}
     */
    wMaxMBperSecTwoResolutionsFullScalability {
        get => NumGet(this, 76, "ushort")
        set => NumPut("ushort", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    wMaxMBperSecThreeResolutionsFullScalability {
        get => NumGet(this, 78, "ushort")
        set => NumPut("ushort", value, this, 78)
    }

    /**
     * @type {Integer}
     */
    wMaxMBperSecFourResolutionsFullScalability {
        get => NumGet(this, 80, "ushort")
        set => NumPut("ushort", value, this, 80)
    }
}
