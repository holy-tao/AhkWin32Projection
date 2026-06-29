#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_RATE_CONTROL_VBR1 {
    #StructPack 8

    InitialQP : UInt32

    MinQP : UInt32

    MaxQP : UInt32

    MaxFrameBitSize : Int64

    TargetAvgBitRate : Int64

    PeakBitRate : Int64

    VBVCapacity : Int64

    InitialVBVFullness : Int64

    QualityVsSpeed : UInt32

}
