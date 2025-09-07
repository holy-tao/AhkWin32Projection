#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an entry from the User Datagram Protocol (UDP) listener table for IPv6 on the local computer. This entry also also includes any available ownership data and the process ID (PID) that issued the call to the bind function for the UDP endpoint.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udp6table_owner_module">MIB_UDP6TABLE_OWNER_MODULE</a> structure is returned by a call to <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getextendedudptable">GetExtendedUdpTable</a> with the <i>TableClass</i> parameter set to a  <b>UDP_TABLE_OWNER_MODULE</b> from the <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ne-iprtrmib-udp_table_class">UDP_TABLE_CLASS</a> enumeration and the <i>ulAf</i> parameter set to <b>AF_INET6</b>. The <b>MIB_UDP6TABLE_OWNER_MODULE</b> structure contains an array of <b>MIB_UDP6ROW_OWNER_MODULE</b> structures.
  * 
  * The <b>ucLocalAddr</b> member is stored in  a character array in network byte order. On Windows Vista and later, the <a href="https://docs.microsoft.com/windows/desktop/api/ip2string/nf-ip2string-rtlipv6addresstostringa">RtlIpv6AddressToString</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ip2string/nf-ip2string-rtlipv6addresstostringexw">RtlIpv6AddressToStringEx</a> functions may be used to convert the IPv6 address in the <b>ucLocalAddr</b> member to a string without loading the Windows Sockets DLL. 
  * 
  * The <b>dwLocalScopeId</b> member is in network byte order. In order to use the <b>dwLocalScopeId</b> member, the <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-ntohl">ntohl</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wsipv6ok/nf-wsipv6ok-inet_ntoa">inet_ntoa</a> functions in Windows Sockets or similar functions may be needed. 
  * 
  * The <b>dwLocalPort</b> member are in network byte order. In order to use the <b>dwLocalPort</b> member, the <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-ntohs">ntohs</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wsipv6ok/nf-wsipv6ok-inet_ntoa">inet_ntoa</a> functions in Windows Sockets or similar functions may be needed. 
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udp6table_owner_module">MIB_UDP6TABLE_OWNER_MODULE</a> structure contains the UDP listener table for IPv6 on the local computer. The name is based on the definition of this table in RFC 2454 published by the IETF. For more information, see 
  * <a href="http://tools.ietf.org/html/rfc2454">http://www.ietf.org/rfc/rfc2454.txt</a>. This table contains UDP  endpoints for IPv6 that have been bound to an address. It should be noted that an application can create a UDP socket and bind it to an address for the sole purpose of sending a UDP datagram, with no intention of receiving packets using this socket (functioning as a listener). 
  * 
  * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed. This  structure is defined in the <i>Udpmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Udpmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Udpmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/udpmib/ns-udpmib-mib_udp6row_owner_module
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_UDP6ROW_OWNER_MODULE extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    /**
     * Type: <b>UCHAR[16]</b>
     * 
     * The IPv6 address of the UDP endpoint on the local computer. This member is stored in  a character array in network byte order. 
     * 
     * A value of zero indicates a UDP listener  willing to accept datagrams for any IP interface associated
     *                       with the local computer.
     * @type {Array<Byte>}
     */
    ucLocalAddr{
        get {
            if(!this.HasProp("__ucLocalAddrProxyArray"))
                this.__ucLocalAddrProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__ucLocalAddrProxyArray
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The scope ID for the IPv6 address of the UDP endpoint on the local computer.
     * @type {Integer}
     */
    dwLocalScopeId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The port number for the local UDP endpoint.
     * @type {Integer}
     */
    dwLocalPort {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The PID of the process that issued a context bind for this endpoint. If this value is set to 0, the information for this endpoint is unavailable.
     * @type {Integer}
     */
    dwOwningPid {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>LARGE_INTEGER</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that indicates when the context bind operation that created this endpoint occurred.
     * @type {Integer}
     */
    liCreateTimestamp {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
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
                this.__OwningModuleInfoProxyArray := Win32FixedArray(this.ptr + 48, 8, Primitive, "uint")
            return this.__OwningModuleInfoProxyArray
        }
    }
}
