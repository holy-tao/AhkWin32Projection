#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSAUDIO_DYNAMIC_RANGE {
    #StructPack 4

    QuietCompression : UInt32

    LoudCompression : UInt32

}
