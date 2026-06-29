#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ICMP_HEADER.ahk" { ICMP_HEADER }
#Import ".\ICMP_MESSAGE.ahk" { ICMP_MESSAGE }
#Import ".\IN6_ADDR.ahk" { IN6_ADDR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ND_NEIGHBOR_ADVERT_HEADER {
    #StructPack 4

    nd_na_hdr : ICMP_MESSAGE

    nd_na_target : IN6_ADDR

}
