#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IGMPV3_REPORT_HEADER {
    #StructPack 2

    Type : Int8

    Reserved : Int8

    Checksum : UInt16

    Reserved2 : UInt16

    RecordCount : UInt16

}
