#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSRTAUDIO_GETREADPACKET_INFO {
    #StructPack 8

    PacketNumber : UInt32

    Flags : UInt32

    PerformanceCounterValue : Int64

    MoreData : BOOL

}
