#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }

/**
 * Contains an entry from the User Datagram Protocol (UDP) listener table for IPv6 on the local computer.
 * @remarks
 * The <b>MIB_UDP6ROW</b> structure is defined on Windows Vista and later. 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getudp6table">GetUdp6Table</a> function retrieves the UDP listener table for IPv6 on the local computer and returns this information in a <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udp6table">MIB_UDP6TABLE</a> structure. 
 * 
 * An array of <b>MIB_UDP6ROW</b> structures are contained in the <b>MIB_UDP6TABLE</b> structure.  
 * 
 * The <b>dwLocalAddr</b> member is stored in  an <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-in_addr">in6_addr</a> structure. The <a href="https://docs.microsoft.com/windows/desktop/api/ip2string/nf-ip2string-rtlipv6addresstostringa">RtlIpv6AddressToString</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ip2string/nf-ip2string-rtlipv6addresstostringexw">RtlIpv6AddressToStringEx</a> functions may be used to convert the IPv6 address in the <b>dwLocalAddr</b> member to a string without loading the Windows Sockets DLL. 
 * 
 * The <b>dwLocalScopeId</b> and <b>dwLocalPort</b> members are in network byte order. In order to use the <b>dwLocalScopeId</b> and <b>dwLocalPort</b> members, the <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-ntohs">ntohs</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wsipv6ok/nf-wsipv6ok-inet_ntoa">inet_ntoa</a> functions in Windows Sockets or similar functions may be needed. 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udp6table">MIB_UDP6TABLE</a> structure contains the UDP listener table for IPv6 on the local computer. The name is based on the definition of this table in RFC 2454 published by the IETF. For more information, see 
 * <a href="http://tools.ietf.org/html/rfc2454">http://www.ietf.org/rfc/rfc2454.txt</a>. This table contains UDP  endpoints for IPv6 that have been bound to an address. It should be noted that an application can create a UDP socket and bind it to an address for the sole purpose of sending a UDP datagram, with no intention of receiving packets using this socket (functioning as a listener).
 * @see https://learn.microsoft.com/windows/win32/api/udpmib/ns-udpmib-mib_udp6row
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_UDP6ROW {
    #StructPack 4

    /**
     * The IPv6 address of the UDP endpoint on the local computer. This member is stored in  a character array in network byte order. 
     * 
     * A value of zero indicates a UDP listener  willing to accept datagrams for any IP interface associated
     *                       with the local computer.
     */
    dwLocalAddr : IN6_ADDR

    /**
     * The scope ID for the IPv6 address of the UDP endpoint on the local computer. This member is stored in network byte order.
     */
    dwLocalScopeId : UInt32

    /**
     * The port number of the UDP endpoint on the local computer. This member is stored in network byte order.
     */
    dwLocalPort : UInt32

}
