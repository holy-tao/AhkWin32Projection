#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSCAMERA_EXTENDEDPROP_VALUE.ahk" { KSCAMERA_EXTENDEDPROP_VALUE }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_EXTENDEDPROP_VIDEOPROCSETTING {
    #StructPack 8

    Mode : UInt32

    Min : Int32

    Max : Int32

    Step : Int32

    VideoProc : KSCAMERA_EXTENDEDPROP_VALUE

    Reserved : Int64

}
