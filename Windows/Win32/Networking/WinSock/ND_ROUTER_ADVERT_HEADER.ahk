#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ICMP_HEADER.ahk" { ICMP_HEADER }
#Import ".\ICMP_MESSAGE.ahk" { ICMP_MESSAGE }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ND_ROUTER_ADVERT_HEADER {
    #StructPack 4

    nd_ra_hdr : ICMP_MESSAGE

    nd_ra_reachable : UInt32

    nd_ra_retransmit : UInt32

}
