#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an entry from the User Datagram Protocol (UDP) listener table for IPv4 on the local computer.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getudptable">GetUdpTable</a> function retrieves the IPv4 UDP listener table on the local computer and returns this information in a <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udptable">MIB_UDPTABLE</a> structure. 
  * 
  * An array of <b>MIB_UDPROW</b> structures are contained in the <b>MIB_UDPTABLE</b> structure.  
  * 
  * The <b>dwLocalAddr</b> member is stored as a <b>DWORD</b> in the same format as the  <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-in_addr">in_addr</a> structure. In order to use the <b>dwLocalAddr</b> member, the <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-ntohl">ntohl</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wsipv6ok/nf-wsipv6ok-inet_ntoa">inet_ntoa</a> functions in Windows Sockets or similar functions may be needed. On Windows Vista and later, the <a href="https://docs.microsoft.com/windows/desktop/api/ip2string/nf-ip2string-rtlipv4addresstostringa">RtlIpv4AddressToString</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ip2string/nf-ip2string-rtlipv4addresstostringexw">RtlIpv4AddressToStringEx</a> functions may be used to convert the IPv4 address in the <b>dwLocalAddr</b>  member to a string without loading the Windows Sockets DLL. 
  * 
  * The <b>dwLocalPort</b> member is in network byte order. In order to use the <b>dwLocalPort</b> member, the <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-ntohs">ntohs</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wsipv6ok/nf-wsipv6ok-inet_ntoa">inet_ntoa</a> functions in Windows Sockets or similar functions may be needed. 
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udptable">MIB_UDPTABLE</a> structure contains the UDP listener table for IPv4 on the local computer. The name is based on the definition of this table in RFC 1213 published by the IETF. For more information, see 
  * <a href="http://tools.ietf.org/html/rfc1213">http://www.ietf.org/rfc/rfc1213.txt</a>. This table contains UDP  endpoints for IPv4 that have been bound to an address. It should be noted that an application can create a UDP socket and bind it to an address for the sole purpose of sending a UDP datagram, with no intention of receiving packets using this socket (functioning as a listener). 
  * 
  * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed. This  structure is defined in the <i>Udpmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Udpmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Udpmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/udpmib/ns-udpmib-mib_udprow
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_UDPROW extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The IPv4 address of the UDP endpoint on the local computer. 
     * 
     * A value of zero indicates a UDP listener  willing to accept datagrams for any IP interface associated
     *                       with the local computer.
     * @type {Integer}
     */
    dwLocalAddr {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The port number of the UDP endpoint on the local computer. This member is stored in network byte order.
     * @type {Integer}
     */
    dwLocalPort {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
