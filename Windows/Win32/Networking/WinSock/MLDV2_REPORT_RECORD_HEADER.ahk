#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IN6_ADDR.ahk" { IN6_ADDR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct MLDV2_REPORT_RECORD_HEADER {
    #StructPack 2

    Type : Int8

    AuxillaryDataLength : Int8

    SourceCount : UInt16

    MulticastAddress : IN6_ADDR

}
