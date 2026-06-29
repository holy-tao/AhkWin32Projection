#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct VBICODECFILTERING_STATISTICS_COMMON_PIN {
    #StructPack 4

    SRBsProcessed : UInt32

    SRBsIgnored : UInt32

    SRBsMissing : UInt32

    InternalErrors : UInt32

    ExternalErrors : UInt32

    Discontinuities : UInt32

    LineConfidenceAvg : UInt32

    BytesOutput : UInt32

}
