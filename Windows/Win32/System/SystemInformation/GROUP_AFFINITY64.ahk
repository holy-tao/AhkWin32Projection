#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemInformation
 */
export default struct GROUP_AFFINITY64 {
    #StructPack 8

    Mask : Int64

    Group : UInt16

    Reserved : UInt16[3]

}
