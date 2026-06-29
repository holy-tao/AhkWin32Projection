#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IN6_PKTINFO.ahk" { IN6_PKTINFO }
#Import ".\IN6_ADDR.ahk" { IN6_ADDR }
#Import ".\SCOPE_ID.ahk" { SCOPE_ID }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IN6_PKTINFO_EX {
    #StructPack 4

    pkt_info : IN6_PKTINFO

    scope_id : SCOPE_ID

}
