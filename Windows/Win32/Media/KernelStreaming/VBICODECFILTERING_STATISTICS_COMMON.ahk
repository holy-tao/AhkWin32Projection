#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct VBICODECFILTERING_STATISTICS_COMMON {
    #StructPack 4

    InputSRBsProcessed : UInt32

    OutputSRBsProcessed : UInt32

    SRBsIgnored : UInt32

    InputSRBsMissing : UInt32

    OutputSRBsMissing : UInt32

    OutputFailures : UInt32

    InternalErrors : UInt32

    ExternalErrors : UInt32

    InputDiscontinuities : UInt32

    DSPFailures : UInt32

    TvTunerChanges : UInt32

    VBIHeaderChanges : UInt32

    LineConfidenceAvg : UInt32

    BytesOutput : UInt32

}
