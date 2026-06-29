#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_DVDCOPY_TITLEKEY {
    #StructPack 4

    KeyFlags : UInt32

    ReservedNT : UInt32[2]

    TitleKey : Int8[6]

    Reserved : Int8[2]

}
