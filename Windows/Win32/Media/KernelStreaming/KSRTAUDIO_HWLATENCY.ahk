#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSRTAUDIO_HWLATENCY {
    #StructPack 4

    FifoSize : UInt32

    ChipsetDelay : UInt32

    CodecDelay : UInt32

}
