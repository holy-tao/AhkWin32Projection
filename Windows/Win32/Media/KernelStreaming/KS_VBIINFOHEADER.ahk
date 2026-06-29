#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_VBIINFOHEADER {
    #StructPack 4

    StartLine : UInt32

    EndLine : UInt32

    SamplingFrequency : UInt32

    MinLineStartTime : UInt32

    MaxLineStartTime : UInt32

    ActualLineStartTime : UInt32

    ActualLineEndTime : UInt32

    VideoStandard : UInt32

    SamplesPerLine : UInt32

    StrideInBytes : UInt32

    BufferSize : UInt32

}
