#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used by the <a href="/windows/win32/api/ws2tcpip/nf-ws2tcpip-getaddrinfoexw">GetAddrInfoExW</a> function to hold host address information when a specific network interface has been requested. (ADDRINFOEX5)
 * @remarks
 * The <b>ADDRINFOEX5</b> structure is used by the <a href="https://docs.microsoft.com/windows/win32/api/ws2tcpip/nf-ws2tcpip-getaddrinfoexw">GetAddrInfoExW</a> function to hold host address information when the <b>AI_EXTENDED</b> or <b>AI_RETURN_TTL</b> bits are set in the *ai_flags* member passed in through the **GetAddrInfoExW** *hints* parameter.
  * 
  * The <b>ADDRINFOEX5</b> structure is an extension of the <a href="https://docs.microsoft.com/windows/win32/api/ws2def/ns-ws2def-addrinfoex4">ADDRINFOEX4</a> structure. In addition to all fields from the <a href="https://docs.microsoft.com/windows/win32/api/ws2def/ns-ws2def-addrinfoex4">ADDRINFOEX4</a> structure, it also holds in the *ai_ttl* member the individual DNS TTL for each returned IP address.
  * 
  * If the <b>AI_RETURN_TTL</b> bit is set in the *ai_flags* member passed in through the <b>GetAddrInfoEx</b> <i>hints</i> parameter, the <b>GetAddrInfoExW</b> <i>ppResult</i> parameter will return a list of <b>ADDRINFOEX5</b> structures. Each node in this list will contain in the *ai_ttl* member the individual DNS TTL for the IP address present in the <b>sockaddr</b> member.
 * @see https://learn.microsoft.com/windows/win32/api/ws2def/ns-ws2def-addrinfoex5
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ADDRINFOEX5 extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * Flags that indicate options used in the 
     * <a href="https://docs.microsoft.com/windows/win32/api/ws2tcpip/nf-ws2tcpip-getaddrinfoexa">GetAddrInfoEx</a> function. 
     * 
     * 
     * Supported values for the <b>ai_flags</b> member are defined in the <i>Winsock2.h</i> include file and can be a combination of the following options.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AI_PASSIVE"></a><a id="ai_passive"></a><dl>
     * <dt><b>AI_PASSIVE</b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The socket address will be used in a call to the <a href="https://docs.microsoft.com/windows/win32/api/winsock/nf-winsock-bind">bind</a>function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AI_CANONNAME"></a><a id="ai_canonname"></a><dl>
     * <dt><b>AI_CANONNAME</b></dt>
     * <dt>0x02</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The canonical name is returned in the first <b>ai_canonname</b> member.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AI_NUMERICHOST"></a><a id="ai_numerichost"></a><dl>
     * <dt><b>AI_NUMERICHOST</b></dt>
     * <dt>0x04</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>nodename</i> parameter passed to the <a href="https://docs.microsoft.com/windows/win32/api/ws2tcpip/nf-ws2tcpip-getaddrinfoexa">GetAddrInfoEx</a> function must be a numeric string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AI_ALL"></a><a id="ai_all"></a><dl>
     * <dt><b>AI_ALL</b></dt>
     * <dt>0x0100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this bit is set, a request is made for IPv6 addresses and IPv4 addresses with <b>AI_V4MAPPED</b>.
     * 
     *  This option is supported on Windows Vista and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AI_ADDRCONFIG"></a><a id="ai_addrconfig"></a><dl>
     * <dt><b>AI_ADDRCONFIG</b></dt>
     * <dt>0x0400</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/win32/api/ws2tcpip/nf-ws2tcpip-getaddrinfoexa">GetAddrInfoEx</a> will resolve only if a global address is configured. The IPv6 and IPv4 loopback address is not considered a valid global address. 
     * 
     * This option is supported on Windows Vista and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AI_V4MAPPED"></a><a id="ai_v4mapped"></a><dl>
     * <dt><b>AI_V4MAPPED</b></dt>
     * <dt>0x0800</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the  <a href="https://docs.microsoft.com/windows/win32/api/ws2tcpip/nf-ws2tcpip-getaddrinfoexa">GetAddrInfoEx</a> request for an IPv6 addresses fails, a name service request is made for IPv4 addresses and these addresses are converted to IPv4-mapped IPv6 address format.
     * 
     * This option is supported on Windows Vista and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AI_NON_AUTHORITATIVE"></a><a id="ai_non_authoritative"></a><dl>
     * <dt><b>AI_NON_AUTHORITATIVE</b></dt>
     * <dt>0x04000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address information is from non-authoritative results. 
     * 
     * When this option is set in the <i>pHints</i> parameter of <a href="https://docs.microsoft.com/windows/win32/api/ws2tcpip/nf-ws2tcpip-getaddrinfoexa">GetAddrInfoEx</a>, the <b>NS_EMAIL</b> namespace provider returns both authoritative and non-authoritative results. If this option is not set, then only authoritative results are returned. 
     * 
     * This option is only supported on Windows Vista and later for the <b>NS_EMAIL</b> namespace.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AI_SECURE"></a><a id="ai_secure"></a><dl>
     * <dt><b>AI_SECURE</b></dt>
     * <dt>0x08000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address information is from a secure channel. 
     * 
     * If the  <b>AI_SECURE</b> bit is set, the <b>NS_EMAIL</b> namespace provider will return results that were obtained with enhanced security to minimize possible spoofing. 
     * 
     * When this option is set in the <i>pHints</i> parameter of <a href="https://docs.microsoft.com/windows/win32/api/ws2tcpip/nf-ws2tcpip-getaddrinfoexa">GetAddrInfoEx</a>, the <b>NS_EMAIL</b> namespace provider returns only results that were obtained with enhanced security to minimize possible spoofing. 
     * 
     * This option is only supported on Windows Vista and later for the <b>NS_EMAIL</b> namespace.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AI_RETURN_PREFERRED_NAMES"></a><a id="ai_return_preferred_names"></a><dl>
     * <dt><b>AI_RETURN_PREFERRED_NAMES</b></dt>
     * <dt>0x010000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address information is for a preferred names for publication with a specific namespace. 
     * 
     * When this option is set in the <i>pHints</i> parameter of <a href="https://docs.microsoft.com/windows/win32/api/ws2tcpip/nf-ws2tcpip-getaddrinfoexa">GetAddrInfoEx</a>, no name should be provided in the <i>pName</i> parameter and the <b>NS_EMAIL</b> namespace provider will return preferred names for publication.
     * 
     * This option is only supported on Windows Vista and later for the <b>NS_EMAIL</b> namespace.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AI_FQDN"></a><a id="ai_fqdn"></a><dl>
     * <dt><b>AI_FQDN</b></dt>
     * <dt>0x00020000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The fully qualified domain name is returned in the first <b>ai_fqdn</b> member.
     * 
     * 
     * When this option is set in the <i>pHints</i> parameter of <a href="https://docs.microsoft.com/windows/win32/api/ws2tcpip/nf-ws2tcpip-getaddrinfoexa">GetAddrInfoEx</a> and a flat name (single label) is specified in the <i>pName</i> parameter,  the fully qualified domain name that the name eventually resolved to will be returned.
     * 
     * This option is supported on Windows 7,  Windows Server 2008 R2,   and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AI_FILESERVER"></a><a id="ai_fileserver"></a><dl>
     * <dt><b>AI_FILESERVER</b></dt>
     * <dt>0x00040000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A  hint to the namespace provider that the hostname being queried is being used in a file share scenario. The namespace provider may ignore this hint.
     * 
     * 
     * This option is supported on Windows 7,  Windows Server 2008 R2,   and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AI_DISABLE_IDN_ENCODING"></a><a id="ai_disable_idn_encoding"></a><dl>
     * <dt><b>AI_DISABLE_IDN_ENCODING</b></dt>
     * <dt>0x00080000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable the automatic International Domain Name encoding using Punycode in the name resolution functions called by the <a href="https://docs.microsoft.com/windows/win32/api/ws2tcpip/nf-ws2tcpip-getaddrinfoexa">GetAddrInfoEx</a> function. 
     * 
     * This option is supported on Windows 8, Windows Server 2012,   and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AI_EXTENDED"></a><a id="ai_extended"></a><dl>
     * <dt><b>AI_EXTENDED</b></dt>
     * <dt>0x80000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the current object is extended: that is, an <a href="https://docs.microsoft.com/windows/win32/api/ws2def/ns-ws2def-addrinfoex2w">addrinfoex2</a> or greater.
     * 
     * This option is supported on Windows 8.1, Windows Server 2012 R2,   and later.
     * 
     * </td>
     * 
     * </tr>
     * <tr>
     * <td width="40%"><a id="AI_RESOLUTION_HANDLE"></a><a id="ai_resolution_handle"></a><dl>
     * <dt><b>AI_RESOLUTION_HANDLE</b></dt>
     * <dt>0x40000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A resolution handle is returned in the <b>ai_resolutionhandle</b> member.
     * 
     * This option is supported on Windows 10, Windows Server 2016,   and later.
     * 
     * </td>
     * </tr>
     * 
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AI_RETURN_TTL</b></dt>
     * <dt>0x0080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of seconds for which the DNS record is valid. If this flag is present, the <b>GetAddrInfoEx</b>.<i>ppResult</i> parameter will return a list of <b>addrinfoex5</b> structures, where the <b>ai_ttl</b> member will contain the individual TTL of the DNS record.</td>
     * </tr>
     * 
     * </table>
     * @type {Integer}
     */
    ai_flags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The address family. 
     * 
     * The possible values for the address family are defined in the <i>Ws2def.h</i> header file. Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
     * 
     * The values currently supported are <b>AF_INET</b> or <b>AF_INET6</b>, which are the Internet
     *                      address family formats for IPv4 and IPv6. Other options for address family (<b>AF_NETBIOS</b> for use with NetBIOS, for example) are supported if a Windows Sockets service provider for the address family is installed. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, <b>AF_INET</b> and <b>PF_INET</b>), so either constant can be used.
     * 
     * The table below lists common values for the address family although many other values are possible. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_UNSPEC"></a><a id="af_unspec"></a><dl>
     * <dt><b>AF_UNSPEC</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address family is unspecified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET"></a><a id="af_inet"></a><dl>
     * <dt><b>AF_INET</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 4 (IPv4) address family.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_NETBIOS"></a><a id="af_netbios"></a><dl>
     * <dt><b>AF_NETBIOS</b></dt>
     * <dt>17</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The NetBIOS address family. This address family is only supported if a Windows Sockets provider for NetBIOS is installed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET6"></a><a id="af_inet6"></a><dl>
     * <dt><b>AF_INET6</b></dt>
     * <dt>23</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 6 (IPv6) address family.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_IRDA"></a><a id="af_irda"></a><dl>
     * <dt><b>AF_IRDA</b></dt>
     * <dt>26</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Infrared Data Association (IrDA) address family. This address family is only supported if the computer has an infrared port and driver installed. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_BTH"></a><a id="af_bth"></a><dl>
     * <dt><b>AF_BTH</b></dt>
     * <dt>32</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Bluetooth address family. This address family is only supported if a Bluetooth adapter is installed.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ai_family {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The socket type. Possible values for the socket type are defined in the <i>Winsock2.h</i> include file.
     * 
     * The following table lists the possible values for the socket type supported for Windows Sockets 2:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SOCK_STREAM"></a><a id="sock_stream"></a><dl>
     * <dt><b>SOCK_STREAM</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Provides sequenced, reliable, two-way, connection-based byte streams with an OOB data transmission mechanism. Uses the Transmission Control Protocol (TCP) for the Internet address family (<b>AF_INET</b> or <b>AF_INET6</b>). If the <b>ai_family</b> member is <b>AF_IRDA</b>, then <b>SOCK_STREAM</b> is the only supported socket type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SOCK_DGRAM"></a><a id="sock_dgram"></a><dl>
     * <dt><b>SOCK_DGRAM</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Supports datagrams, which are connectionless, unreliable buffers of a fixed (typically small) maximum length. Uses the User Datagram Protocol (UDP) for the Internet address family (<b>AF_INET</b> or <b>AF_INET6</b>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SOCK_RAW"></a><a id="sock_raw"></a><dl>
     * <dt><b>SOCK_RAW</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Provides a raw socket that allows an application to manipulate the next upper-layer protocol header. To manipulate the IPv4 header, the <a href="https://docs.microsoft.com/windows/win32/WinSock/ipproto-ip-socket-options">IP_HDRINCL</a> socket option must be set on the socket.  To manipulate the IPv6 header, the <a href="https://docs.microsoft.com/windows/win32/WinSock/ipproto-ipv6-socket-options">IPV6_HDRINCL</a> socket option must be set on the socket.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SOCK_RDM"></a><a id="sock_rdm"></a><dl>
     * <dt><b>SOCK_RDM</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Provides a reliable message datagram. An example of this type is the Pragmatic General Multicast (PGM) multicast protocol implementation in Windows, often referred to as <a href="https://docs.microsoft.com/windows/win32/WinSock/reliable-multicast-programming--pgm-">reliable multicast programming</a>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SOCK_SEQPACKET"></a><a id="sock_seqpacket"></a><dl>
     * <dt><b>SOCK_SEQPACKET</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Provides a pseudo-stream packet based on datagrams. 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * In Windows Sockets 2, new socket types were introduced. An application can dynamically discover the attributes of each available transport protocol through the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winsock2/nf-winsock2-wsaenumprotocolsa">WSAEnumProtocols</a> function. So an application can determine the possible socket type and protocol options for an address family  and use this information when specifying this parameter. Socket type definitions in the <i>Winsock2.h</i> and <i>Ws2def.h</i> header files will be periodically updated as new socket types, address families, and protocols are defined.
     * 
     * In Windows Sockets 1.1, the only possible socket types are <b>SOCK_DATAGRAM</b> and <b>SOCK_STREAM</b>.
     * @type {Integer}
     */
    ai_socktype {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The protocol type. The possible options are specific to the address family and socket type specified. Possible values for the <b>ai_protocol</b> are defined in <i>Winsock2.h</i> and the <i>Wsrm.h</i> header files. 
     * 
     * On the Windows SDK released for Windows Vista and later,, the organization of header files has changed and this member can be one of the values from the <b>IPPROTO</b> enumeration type defined in the <i>Ws2def.h</i> header file. Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
     * 
     * If a value of  0 is specified for <b>ai_protocol</b>, the caller does not
     *               wish to specify a protocol and the service provider will choose the <b>ai_protocol</b> to use. For protocols other than IPv4 and IPv6, set <b>ai_protocol</b> to zero.
     * 
     * The following table lists common values for the <b>ai_protocol</b> member although many other values are possible.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPPROTO_TCP"></a><a id="ipproto_tcp"></a><dl>
     * <dt><b>IPPROTO_TCP</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Transmission Control Protocol (TCP). This is a possible value when the <b>ai_family</b> member is <b>AF_INET</b> or <b>AF_INET6</b> and the <b>ai_socktype</b> member is <b>SOCK_STREAM</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPPROTO_UDP"></a><a id="ipproto_udp"></a><dl>
     * <dt><b>IPPROTO_UDP</b></dt>
     * <dt>17</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The User Datagram Protocol (UDP). This is a possible value when the <b>ai_family</b> member is <b>AF_INET</b> or <b>AF_INET6</b> and the <i>type</i> parameter is <b>SOCK_DGRAM</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPPROTO_RM"></a><a id="ipproto_rm"></a><dl>
     * <dt><b>IPPROTO_RM</b></dt>
     * <dt>113</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The PGM protocol for reliable multicast. This is a possible value when the <b>ai_family</b> member is <b>AF_INET</b> and the <b>ai_socktype</b> member is <b>SOCK_RDM</b>. On the Windows SDK released for Windows Vista and later,  this value is also called <b>IPPROTO_PGM</b>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the <b>ai_family</b> member is <b>AF_IRDA</b>, then the <b>ai_protocol</b> must be 0.
     * @type {Integer}
     */
    ai_protocol {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The length, in bytes, of the  buffer pointed to by the <b>ai_addr</b> member.
     * @type {Pointer}
     */
    ai_addrlen {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The canonical name for the host.
     * @type {Pointer<PWSTR>}
     */
    ai_canonname {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/WinSock/sockaddr-2">sockaddr</a> structure. The <b>ai_addr</b> member in each returned <b>addrinfoex4</b> structure points to a filled-in socket address structure. The length, in bytes, of each returned <b>addrinfoex4</b> structure is specified in the <b>ai_addrlen</b> member.
     * @type {Pointer<SOCKADDR>}
     */
    ai_addr {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to data that is used to return provider-specific namespace information that is associated with the name beyond a list of addresses. The length, in bytes, of the buffer pointed to by <b>ai_blob</b> must be specified in the <b>ai_bloblen</b> member.
     * @type {Pointer<Void>}
     */
    ai_blob {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The length, in bytes, of the <b>ai_blob</b> member.
     * @type {Pointer}
     */
    ai_bloblen {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A pointer to the GUID of a specific namespace provider.
     * @type {Pointer<Guid>}
     */
    ai_provider {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A pointer to the next structure in a linked list. This parameter is set to <b>NULL</b> in the last 
     * <b>addrinfoex4</b> structure of a linked list.
     * @type {Pointer<ADDRINFOEX5>}
     */
    ai_next {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * The version number of this structure. The value currently used for this version of the structure is 4.
     * @type {Integer}
     */
    ai_version {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * The fully qualified domain name for the host.
     * @type {Pointer<PWSTR>}
     */
    ai_fqdn {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * The interface index, as defined by the <a href="https://docs.microsoft.com/windows/win32/api/iptypes/ns-iptypes-ip_adapter_addresses_lh">IP_ADAPTER_ADDRESSES</a>.<i>IfIndex</i> property returned in <a href="https://docs.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-getadaptersaddresses">GetAdaptersAddresses</a>.
     * @type {Integer}
     */
    ai_interfaceindex {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * Handle pointing to the fully qualified domain name for the host.
     * @type {Pointer<HANDLE>}
     */
    ai_resolutionhandle {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Number of seconds for which this DNS record is valid.
     * @type {Integer}
     */
    ai_ttl {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }
}
