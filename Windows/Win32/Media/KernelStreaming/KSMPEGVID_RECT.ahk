#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSMPEGVID_RECT {
    #StructPack 4

    StartX : UInt32

    StartY : UInt32

    EndX : UInt32

    EndY : UInt32

}
