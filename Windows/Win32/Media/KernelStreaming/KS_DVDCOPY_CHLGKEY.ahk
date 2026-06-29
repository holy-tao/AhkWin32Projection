#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_DVDCOPY_CHLGKEY {
    #StructPack 1

    ChlgKey : Int8[10]

    Reserved : Int8[2]

}
