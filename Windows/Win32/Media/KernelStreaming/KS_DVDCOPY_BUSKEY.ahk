#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_DVDCOPY_BUSKEY {
    #StructPack 1

    BusKey : Int8[5]

    Reserved : Int8[1]

}
