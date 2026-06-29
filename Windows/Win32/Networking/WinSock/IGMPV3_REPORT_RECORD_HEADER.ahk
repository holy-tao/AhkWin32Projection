#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IN_ADDR.ahk" { IN_ADDR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IGMPV3_REPORT_RECORD_HEADER {
    #StructPack 4

    Type : Int8

    AuxillaryDataLength : Int8

    SourceCount : UInt16

    MulticastAddress : IN_ADDR

}
