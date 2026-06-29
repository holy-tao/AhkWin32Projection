#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IN_ADDR.ahk" { IN_ADDR }
#Import ".\IN_PKTINFO.ahk" { IN_PKTINFO }
#Import ".\SCOPE_ID.ahk" { SCOPE_ID }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IN_PKTINFO_EX {
    #StructPack 4

    pkt_info : IN_PKTINFO

    scope_id : SCOPE_ID

}
