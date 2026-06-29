#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\IN_ADDR.ahk" { IN_ADDR }
#Import "..\..\Networking\WinSock\SOCKADDR_INET.ahk" { SOCKADDR_INET }
#Import "..\..\Networking\WinSock\SOCKADDR_IN.ahk" { SOCKADDR_IN }
#Import ".\MIB_IPFORWARD_ROW2.ahk" { MIB_IPFORWARD_ROW2 }
#Import ".\IP_ADDRESS_PREFIX.ahk" { IP_ADDRESS_PREFIX }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Networking\WinSock\NL_ROUTE_ORIGIN.ahk" { NL_ROUTE_ORIGIN }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }
#Import "..\..\Networking\WinSock\NL_ROUTE_PROTOCOL.ahk" { NL_ROUTE_PROTOCOL }
#Import "..\..\Networking\WinSock\SOCKADDR_IN6.ahk" { SOCKADDR_IN6 }
#Import "..\..\Networking\WinSock\SCOPE_ID.ahk" { SCOPE_ID }
#Import "..\Ndis\NET_LUID_LH.ahk" { NET_LUID_LH }
#Import "..\..\Networking\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains a table of IP route entries.
 * @remarks
 * The <b>MIB_IPFORWARD_TABLE2</b> structure is defined on Windows Vista and later. 
 * 
 * The <b>GetIpForwardTable2</b> function enumerates the IP route entries on a local system and returns this information in a <b>MIB_IPFORWARD_TABLE2</b> structure. 
 * 
 * 
 * 
 * The <b>GetIpForwardEntry2</b> function retrieves a single IP route entry and returns this information in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structure.
 * 
 * The <b>MIB_IPFORWARD_TABLE2</b> structure may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> array entry in the <b>Table</b> member. Padding for alignment may also be present between the <b>MIB_IPFORWARD_ROW2</b> array entries in the <b>Table</b> member. Any access to a <b>MIB_IPFORWARD_ROW2</b> array entry should assume  padding may exist. 
 * 
 * 
 * 
 * Note that the <i>Netioapi.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Netioapi.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-mib_ipforward_table2
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IPFORWARD_TABLE2 {
    #StructPack 8

    /**
     * A value that specifies the number of IP route entries in the array.
     */
    NumEntries : UInt32

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipforward_row2">MIB_IPFORWARD_ROW2</a> structures containing IP route entries.
     */
    Table : MIB_IPFORWARD_ROW2[1]

}
