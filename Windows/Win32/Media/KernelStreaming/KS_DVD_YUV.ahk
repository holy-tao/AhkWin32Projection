#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_DVD_YUV {
    #StructPack 1

    Reserved : Int8

    Y : Int8

    V : Int8

    U : Int8

}
