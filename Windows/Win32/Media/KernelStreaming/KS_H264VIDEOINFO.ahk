#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_H264VIDEOINFO {
    #StructPack 4

    wWidth : UInt16

    wHeight : UInt16

    wSARwidth : UInt16

    wSARheight : UInt16

    wProfile : UInt16

    bLevelIDC : Int8

    wConstrainedToolset : UInt16

    bmSupportedUsages : UInt32

    bmCapabilities : UInt16

    bmSVCCapabilities : UInt32

    bmMVCCapabilities : UInt32

    dwFrameInterval : UInt32

    bMaxCodecConfigDelay : Int8

    bmSupportedSliceModes : Int8

    bmSupportedSyncFrameTypes : Int8

    bResolutionScaling : Int8

    bSimulcastSupport : Int8

    bmSupportedRateControlModes : Int8

    wMaxMBperSecOneResolutionNoScalability : UInt16

    wMaxMBperSecTwoResolutionsNoScalability : UInt16

    wMaxMBperSecThreeResolutionsNoScalability : UInt16

    wMaxMBperSecFourResolutionsNoScalability : UInt16

    wMaxMBperSecOneResolutionTemporalScalability : UInt16

    wMaxMBperSecTwoResolutionsTemporalScalablility : UInt16

    wMaxMBperSecThreeResolutionsTemporalScalability : UInt16

    wMaxMBperSecFourResolutionsTemporalScalability : UInt16

    wMaxMBperSecOneResolutionTemporalQualityScalability : UInt16

    wMaxMBperSecTwoResolutionsTemporalQualityScalability : UInt16

    wMaxMBperSecThreeResolutionsTemporalQualityScalablity : UInt16

    wMaxMBperSecFourResolutionsTemporalQualityScalability : UInt16

    wMaxMBperSecOneResolutionTemporalSpatialScalability : UInt16

    wMaxMBperSecTwoResolutionsTemporalSpatialScalability : UInt16

    wMaxMBperSecThreeResolutionsTemporalSpatialScalablity : UInt16

    wMaxMBperSecFourResolutionsTemporalSpatialScalability : UInt16

    wMaxMBperSecOneResolutionFullScalability : UInt16

    wMaxMBperSecTwoResolutionsFullScalability : UInt16

    wMaxMBperSecThreeResolutionsFullScalability : UInt16

    wMaxMBperSecFourResolutionsFullScalability : UInt16

}
