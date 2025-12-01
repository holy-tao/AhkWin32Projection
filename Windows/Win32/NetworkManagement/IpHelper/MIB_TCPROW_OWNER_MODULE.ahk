#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that describes an IPv4 TCP connection with ownership data, IPv4 addresses, ports used by the TCP connection, and the specific process ID (PID) associated with connection.
 * @remarks
 * The <b>MIB_TCPROW_OWNER_MODULE</b> structure is returned by a call to <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getextendedtcptable">GetExtendedTcpTable</a> with the <i>TableClass</i> parameter set to  <b>TCP_TABLE_OWNER_MODULE_LISTENER</b>, <b>TCP_TABLE_OWNER_MODULE_CONNECTIONS</b>, or <b>TCP_TABLE_OWNER_MODULE_ALL</b> from the <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ne-iprtrmib-tcp_table_class">TCP_TABLE_CLASS</a> enumeration and the <i>ulAf</i> parameter set to <b>AF_INET4</b>.
 * 
 *   The <b>dwState</b> member indicates the state of the TCP entry in a TCP state diagram. A TCP connection progresses through a series of states during its
 *   lifetime.  The states are:  LISTEN, SYN-SENT, SYN-RECEIVED,
 *   ESTABLISHED, FIN-WAIT-1, FIN-WAIT-2, CLOSE-WAIT, CLOSING, LAST-ACK,
 *   TIME-WAIT, and the fictional state CLOSED.  The CLOSED state is fictional
 *   because it represents the state when there is no Transmission Control Block, and therefore,
 *   no connection.  The TCP protocol is described in RFC 793. For more information, see 
 * <a href="https://www.ietf.org/rfc/rfc793.txt">http://www.ietf.org/rfc/rfc793.txt</a>. 
 * 
 * The <b>dwLocalPort</b>, and <b>dwRemotePort</b> members are in network byte order. In order to use the <b>dwLocalPort</b> or <b>dwRemotePort</b> members, the <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-ntohs">ntohs</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wsipv6ok/nf-wsipv6ok-inet_ntoa">inet_ntoa</a> functions in Windows Sockets or similar functions may be needed. The <b>dwLocalAddr</b> and <b>dwRemoteAddr</b> members are stored as a <b>DWORD</b> in the same format as the  <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-in_addr">in_addr</a> structure. In order to use the <b>dwLocalAddr</b> or <b>dwRemoteAddr</b> members, the <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-ntohl">ntohl</a> or <b>inet_ntoa</b> functions in Windows Sockets or similar functions may be needed. On Windows Vista and later, the <a href="https://docs.microsoft.com/windows/desktop/api/ip2string/nf-ip2string-rtlipv4addresstostringa">RtlIpv4AddressToString</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ip2string/nf-ip2string-rtlipv4addresstostringexw">RtlIpv4AddressToStringEx</a> functions may be used to convert the IPv4 address in the <b>dwLocalAddr</b> or <b>dwRemoteAddr</b> members to a string without loading the Windows Sockets DLL. 
 * 
 * On the Windows SDK released for Windows Vista and later, the organization of header files has changed. This  structure is defined in the <i>Tcpmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Tcpmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Tcpmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/tcpmib/ns-tcpmib-mib_tcprow_owner_module
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_TCPROW_OWNER_MODULE extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwState {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The local IPv4 address for the TCP connection on the local computer. A value of zero indicates the listener  can accept a connection on any interface.
     * @type {Integer}
     */
    dwLocalAddr {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The local port number in network byte order for the TCP connection on the local computer.
     * @type {Integer}
     */
    dwLocalPort {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The IPv4 address for the TCP connection on the remote computer. When the <b>dwState</b> member is <b>MIB_TCP_STATE_LISTEN</b>, this value has no meaning.
     * @type {Integer}
     */
    dwRemoteAddr {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The remote port number in network byte order for the TCP connection on the remote computer. When the <b>dwState</b> member is <b>MIB_TCP_STATE_LISTEN</b>, this member has no meaning.
     * @type {Integer}
     */
    dwRemotePort {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The PID of the process that issued a context bind for this TCP connection.
     * @type {Integer}
     */
    dwOwningPid {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>LARGE_INTEGER</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that indicates when the context bind operation that created this TCP link occurred.
     * @type {Integer}
     */
    liCreateTimestamp {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * Type: <b>ULONGLONG[TCPIP_OWNING_MODULE_SIZE]</b>
     * 
     * An array of opaque data that contains ownership information.
     * @type {Array<UInt64>}
     */
    OwningModuleInfo{
        get {
            if(!this.HasProp("__OwningModuleInfoProxyArray"))
                this.__OwningModuleInfoProxyArray := Win32FixedArray(this.ptr + 32, 16, Primitive, "uint")
            return this.__OwningModuleInfoProxyArray
        }
    }
}
