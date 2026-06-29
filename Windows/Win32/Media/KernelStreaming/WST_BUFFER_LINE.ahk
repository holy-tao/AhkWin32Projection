#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct WST_BUFFER_LINE {
    #StructPack 1

    Confidence : Int8

    Bytes : Int8[42]

}
