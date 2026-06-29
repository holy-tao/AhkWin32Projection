#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IN6_ADDR.ahk" { IN6_ADDR }

/**
 * The sockaddr_in6_old (ws2ipdef.h) structure varies depending on the protocol selected.
 * @see https://learn.microsoft.com/windows/win32/api/ws2ipdef/ns-ws2ipdef-sockaddr_in6_old
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct sockaddr_in6_old {
    #StructPack 4

    sin6_family : Int16

    sin6_port : UInt16

    sin6_flowinfo : UInt32

    sin6_addr : IN6_ADDR

}
