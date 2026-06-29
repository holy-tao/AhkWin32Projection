#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSAUDIO_PRESENTATION_POSITION {
    #StructPack 8

    u64PositionInBlocks : Int64

    u64QPCPosition : Int64

}
