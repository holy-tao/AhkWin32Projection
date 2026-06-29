#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct CC_BYTE_PAIR {
    #StructPack 2

    Decoded : Int8[2]

    Reserved : UInt16

}
