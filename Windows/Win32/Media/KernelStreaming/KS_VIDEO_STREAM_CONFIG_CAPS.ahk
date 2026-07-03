#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_VIDEO_STREAM_CONFIG_CAPS {
    #StructPack 8

    guid : Guid

    VideoStandard : UInt32

    InputSize : SIZE

    MinCroppingSize : SIZE

    MaxCroppingSize : SIZE

    CropGranularityX : Int32

    CropGranularityY : Int32

    CropAlignX : Int32

    CropAlignY : Int32

    MinOutputSize : SIZE

    MaxOutputSize : SIZE

    OutputGranularityX : Int32

    OutputGranularityY : Int32

    StretchTapsX : Int32

    StretchTapsY : Int32

    ShrinkTapsX : Int32

    ShrinkTapsY : Int32

    MinFrameInterval : Int64

    MaxFrameInterval : Int64

    MinBitsPerSecond : Int32

    MaxBitsPerSecond : Int32

}
