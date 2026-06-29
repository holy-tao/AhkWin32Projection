#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_DVDCOPY_DISCKEY {
    #StructPack 1

    DiscKey : Int8[2048]

}
