#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSAUDIO_POSITION {
    #StructPack 8

    PlayOffset : Int64

    WriteOffset : Int64

}
