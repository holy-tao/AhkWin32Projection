#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IN_ADDR.ahk" { IN_ADDR }
#Import ".\SOCKADDR_IN6.ahk" { SOCKADDR_IN6 }
#Import ".\SOCKADDR_IN.ahk" { SOCKADDR_IN }
#Import ".\IN6_ADDR.ahk" { IN6_ADDR }
#Import ".\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import ".\SCOPE_ID.ahk" { SCOPE_ID }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains an IPv4, an IPv6 address, or an address family.
 * @remarks
 * The <b>SOCKADDR_INET</b> union is defined on Windows Vista and later. 
 * 
 * The <b>SOCKADDR_INET</b> union is a convenience structure for accessing an IPv4 address, an IPv6 address, or the IP address family without having to cast  the <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> structure.
 * 
 * The <b>SOCKADDR_INET</b> union is the data type of the <b>Prefix</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-ip_address_prefix">IP_ADDRESS_PREFIX</a> structure  
 * 
 * Note that the <i>Ws2ipdef.h</i> header file is automatically included in <i>Ws2tcpip.h</i> header file, and should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ws2ipdef/ns-ws2ipdef-sockaddr_inet
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKADDR_INET {
    #StructPack 4

    /**
     * Type: <b>SOCKADDR_IN</b>
     * 
     * An IPv4 address represented as a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">SOCKADDR_IN</a> structure containing the address family and the IPv4 address. The address family is in host byte order and the IPv4 address is  in network byte order.
     * 
     * On the Windows SDK released for Windows Vista and later, the organization of header files has changed and the <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">SOCKADDR_IN</a> structure is defined in the <i>Ws2def.h</i> header file. Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
     */
    Ipv4 : SOCKADDR_IN

    static __New() {
        DefineProp(this.Prototype, 'Ipv6', { type: SOCKADDR_IN6, offset: 0 })
        DefineProp(this.Prototype, 'si_family', { type: ADDRESS_FAMILY, offset: 0 })
        this.DeleteProp("__New")
    }
}
