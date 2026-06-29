#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\IN_ADDR.ahk" { IN_ADDR }
#Import "..\..\Networking\WinSock\SOCKADDR_IN6.ahk" { SOCKADDR_IN6 }
#Import "..\..\Networking\WinSock\NL_NEIGHBOR_STATE.ahk" { NL_NEIGHBOR_STATE }
#Import "..\..\Networking\WinSock\SOCKADDR_IN.ahk" { SOCKADDR_IN }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }
#Import "..\..\Networking\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Networking\WinSock\SCOPE_ID.ahk" { SCOPE_ID }
#Import "..\..\Networking\WinSock\SOCKADDR_INET.ahk" { SOCKADDR_INET }
#Import "..\Ndis\NET_LUID_LH.ahk" { NET_LUID_LH }
#Import ".\MIB_IPNET_ROW2.ahk" { MIB_IPNET_ROW2 }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains a table of neighbor IP address entries.
 * @remarks
 * The <b>MIB_IPNET_TABLE2</b> structure is defined on Windows Vista and later. 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipnettable2">GetIpNetTable2</a> function enumerates the neighbor IP addresses on a local system and returns this information in an <b>MIB_IPNET_TABLE2</b> structure. 
 * 
 * For IPv4, this includes addresses determined used the Address Resolution Protocol (ARP). For IPv6, this includes addresses determined using the Neighbor Discovery (ND) protocol for IPv6 as specified in RFC 2461. For more information, see <a href="https://www.ietf.org/rfc/rfc2461.txt">http://www.ietf.org/rfc/rfc2461.txt</a>. 
 * 
 * The <b>MIB_IPNET_TABLE2</b> structure may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> array entry in the <b>Table</b> member. Padding for alignment may also be present between the <b>MIB_IPNET_ROW2</b> array entries in the <b>Table</b> member. Any access to a <b>MIB_IPNET_ROW2</b> array entry should assume  padding may exist. 
 * 
 * 
 * 
 * Note that the <i>Netioapi.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Netioapi.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-mib_ipnet_table2
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IPNET_TABLE2 {
    #StructPack 8

    /**
     * A value that specifies the number of IP network neighbor address entries in the array.
     */
    NumEntries : UInt32

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipnet_row2">MIB_IPNET_ROW2</a> structures containing IP network neighbor address entries.
     */
    Table : MIB_IPNET_ROW2[1]

}
