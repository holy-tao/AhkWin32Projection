#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\IN_ADDR.ahk" { IN_ADDR }
#Import "..\..\Networking\WinSock\SOCKADDR_INET.ahk" { SOCKADDR_INET }
#Import "..\..\Networking\WinSock\SOCKADDR_IN.ahk" { SOCKADDR_IN }
#Import ".\MIB_IPPATH_ROW.ahk" { MIB_IPPATH_ROW }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }
#Import "..\..\Networking\WinSock\SOCKADDR_IN6.ahk" { SOCKADDR_IN6 }
#Import "..\..\Networking\WinSock\SCOPE_ID.ahk" { SCOPE_ID }
#Import "..\Ndis\NET_LUID_LH.ahk" { NET_LUID_LH }
#Import "..\..\Networking\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains a table of IP path entries.
 * @remarks
 * The <b>MIB_IPPATH_TABLE</b> structure is defined on Windows Vista and later. 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getippathtable">GetIpPathTable</a> function enumerates the IP path entries on a local system and returns this information in a <b>MIB_IPPATH_TABLE</b> structure. 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-flushippathtable">FlushIpPathTable</a> function flushes the IP path table entries on a local system. 
 * 
 * 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getippathentry">GetIpPathEntry</a> function retrieves a single IP path entry and returns this information in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ippath_row">MIB_IPPATH_ROW</a> structure.
 * 
 * The <b>MIB_IPPATH_TABLE</b> structure may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ippath_row">MIB_IPPATH_ROW</a> array entry in the <b>Table</b> member. Padding for alignment may also be present between the <b>MIB_IPPATH_ROW</b> array entries in the <b>Table</b> member. Any access to a <b>MIB_IPPATH_ROW</b> array entry should assume  padding may exist.
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-mib_ippath_table
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IPPATH_TABLE {
    #StructPack 8

    /**
     * A value that specifies the number of IP path entries in the array.
     */
    NumEntries : UInt32

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ippath_row">MIB_IPPATH_ROW</a> structures containing IP path entries.
     */
    Table : MIB_IPPATH_ROW[1]

}
