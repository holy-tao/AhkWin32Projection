#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIB_UDP6ROW.ahk" { MIB_UDP6ROW }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }

/**
 * Contains the User Datagram Protocol (UDP) listener table for IPv6 on the local computer.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getudp6table">GetUdp6Table</a> function enumerates the UDP  endpoints for IPv6 that have been bound to an address on the local computer and returns this information in a <b>MIB_UDP6TABLE</b> structure. 
 * 
 * This table includes the local IPv6 address, scope ID, and port information for sending and receiving UDP datagrams on the local computer. An array of <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udp6row">MIB_UDP6ROW</a> structures are contained in the <b>MIB_UDP6TABLE</b> structure.
 * 
 * The <b>MIB_UDP6TABLE</b> structure may contain padding for alignment between the <b>dwNumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udp6row">MIB_UDP6ROW</a> array entry in the <b>table</b> member. Padding for alignment may also be present between the <b>MIB_UDP6ROW</b> array entries in the <b>table</b> member. Any access to a <b>MIB_UDP6ROW</b> array entry should assume  padding may exist. 
 * 
 * 
 * 
 * The <b>MIB_UDP6TABLE</b> structure contains the UDP listener table for IPv6 on the local computer. The name is based on the definition of this table in RFC 2454 published by the IETF. For more information, see 
 * <a href="http://tools.ietf.org/html/rfc2454">http://www.ietf.org/rfc/rfc2454.txt</a>. This table contains UDP  endpoints for IPv6 that have been bound to an address. It should be noted that an application can create a UDP socket and bind it to an address for the sole purpose of sending a UDP datagram, with no intention of receiving packets using this socket (functioning as a listener). 
 * 
 * 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udp6table_owner_module">MIB_UDP6TABLE_OWNER_MODULE</a> structure is an enhanced version of the  <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udp6table_owner_pid">MIB_UDP6TABLE_OWNER_PID</a> structure that includes any available ownership data for each UDP endpoint in the table.  The <b>MIB_UDP6TABLE_OWNER_PID</b> is an enhanced version of the <b>MIB_UDP6TABLE</b> that includes the process ID (PID) that issued the call to the <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-bind">bind</a> function for each UDP endpoint in the table.
 * @see https://learn.microsoft.com/windows/win32/api/udpmib/ns-udpmib-mib_udp6table
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_UDP6TABLE {
    #StructPack 4

    /**
     * The number of entries in the table.
     */
    dwNumEntries : UInt32

    /**
     * A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/udpmib/ns-udpmib-mib_udp6row">MIB_UDP6ROW</a> structures.
     */
    table : MIB_UDP6ROW[1]

}
