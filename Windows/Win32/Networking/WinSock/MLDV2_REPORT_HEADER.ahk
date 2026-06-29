#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ICMP_HEADER.ahk" { ICMP_HEADER }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct MLDV2_REPORT_HEADER {
    #StructPack 2

    IcmpHeader : ICMP_HEADER

    Reserved : UInt16

    RecordCount : UInt16

}
