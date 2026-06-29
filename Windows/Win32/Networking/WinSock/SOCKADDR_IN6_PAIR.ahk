#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOCKADDR_IN6.ahk" { SOCKADDR_IN6 }

/**
 * Contains pointers to a pair of IP addresses that represent a source and destination address pair.
 * @remarks
 * The <b>SOCKADDR_IN6_PAIR</b> structure is defined on Windows Vista and later. 
 * 
 * Any IPv4 addresses in the <b>SOCKADDR_IN6_PAIR</b> structure must be represented in the IPv4-mapped IPv6 address format which enables an IPv6 only application to communicate with an IPv4 node. For more information on the IPv4-mapped IPv6 address format, see <a href="https://docs.microsoft.com/windows/desktop/WinSock/dual-stack-sockets">Dual-Stack Sockets</a>.
 * 
 * The <b>SOCKADDR_IN6_PAIR</b> structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-createsortedaddresspairs">CreateSortedAddressPairs</a> function.  
 * 
 * Note that the <i>Ws2ipdef.h</i> header file is automatically included in <i>Ws2tcpip.h</i> header file, and should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ws2ipdef/ns-ws2ipdef-sockaddr_in6_pair
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKADDR_IN6_PAIR {
    #StructPack 8

    /**
     * A pointer to an IP source address represented as a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">SOCKADDR_IN6</a> structure. The address family is in host byte order and the IPv6 address, port, flow information, and zone ID are  in network byte order.
     */
    SourceAddress : SOCKADDR_IN6.Ptr

    /**
     * A pointer to an IP source address represented as a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">SOCKADDR_IN6</a> structure. The address family is in host byte order and the IPv6 address, port, flow information, and zone ID are  in network byte order.
     */
    DestinationAddress : SOCKADDR_IN6.Ptr

}
