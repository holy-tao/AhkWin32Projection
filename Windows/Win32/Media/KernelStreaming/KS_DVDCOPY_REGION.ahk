#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_DVDCOPY_REGION {
    #StructPack 1

    Reserved : Int8

    RegionData : Int8

    Reserved2 : Int8[2]

}
