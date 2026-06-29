#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_PERFRAMESETTING_HEADER {
    #StructPack 8

    Size : UInt32

    FrameCount : UInt32

    Id : Guid

    Flags : Int64

    LoopCount : UInt32

    Reserved : UInt32

}
