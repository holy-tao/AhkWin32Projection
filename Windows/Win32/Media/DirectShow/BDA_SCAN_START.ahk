#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_SCAN_START {
    #StructPack 4

    lResult : Int32

    LowerFrequency : UInt32

    HigerFrequency : UInt32

}
