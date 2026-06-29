#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct WMDRMProtectionInfo {
    #StructPack 8

    wszKID : UInt16[25]

    qwCounter : Int64

    qwIndex : Int64

    bOffset : Int8

}
