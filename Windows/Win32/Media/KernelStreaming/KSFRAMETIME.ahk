#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSFRAMETIME {
    #StructPack 8

    Duration : Int64

    FrameFlags : UInt32

    Reserved : UInt32

}
