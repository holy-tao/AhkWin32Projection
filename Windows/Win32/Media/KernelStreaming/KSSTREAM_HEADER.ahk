#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSTIME.ahk" { KSTIME }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @architecture X64, Arm64
 */
export default struct KSSTREAM_HEADER {
    #StructPack 8

    Size : UInt32

    TypeSpecificFlags : UInt32

    PresentationTime : KSTIME

    Duration : Int64

    FrameExtent : UInt32

    DataUsed : UInt32

    Data : IntPtr

    OptionsFlags : UInt32

    Reserved : UInt32

}
