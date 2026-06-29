#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VBICODECFILTERING_STATISTICS_COMMON.ahk" { VBICODECFILTERING_STATISTICS_COMMON }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct VBICODECFILTERING_STATISTICS_NABTS {
    #StructPack 4

    Common : VBICODECFILTERING_STATISTICS_COMMON

    FECBundleBadLines : UInt32

    FECQueueOverflows : UInt32

    FECCorrectedLines : UInt32

    FECUncorrectableLines : UInt32

    BundlesProcessed : UInt32

    BundlesSent2IP : UInt32

    FilteredLines : UInt32

}
