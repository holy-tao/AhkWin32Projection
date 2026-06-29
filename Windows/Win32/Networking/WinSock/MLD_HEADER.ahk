#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ICMP_HEADER.ahk" { ICMP_HEADER }
#Import ".\IN6_ADDR.ahk" { IN6_ADDR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct MLD_HEADER {
    #StructPack 2

    IcmpHeader : ICMP_HEADER

    MaxRespTime : UInt16

    Reserved : UInt16

    MulticastAddress : IN6_ADDR

}
