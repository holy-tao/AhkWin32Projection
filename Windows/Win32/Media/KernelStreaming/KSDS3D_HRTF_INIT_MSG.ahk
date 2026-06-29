#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSDS3D_HRTF_FILTER_QUALITY.ahk" { KSDS3D_HRTF_FILTER_QUALITY }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSDS3D_HRTF_INIT_MSG {
    #StructPack 4

    Size : UInt32

    Quality : KSDS3D_HRTF_FILTER_QUALITY

    SampleRate : Float32

    MaxFilterSize : UInt32

    FilterTransientMuteLength : UInt32

    FilterOverlapBufferLength : UInt32

    OutputOverlapBufferLength : UInt32

    Reserved : UInt32

}
