#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\IN_ADDR.ahk" { IN_ADDR }
#Import "..\..\Networking\WinSock\SOCKADDR_INET.ahk" { SOCKADDR_INET }
#Import "..\..\Networking\WinSock\SOCKADDR_IN.ahk" { SOCKADDR_IN }
#Import ".\MIB_ANYCASTIPADDRESS_ROW.ahk" { MIB_ANYCASTIPADDRESS_ROW }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }
#Import "..\..\Networking\WinSock\SOCKADDR_IN6.ahk" { SOCKADDR_IN6 }
#Import "..\..\Networking\WinSock\SCOPE_ID.ahk" { SCOPE_ID }
#Import "..\Ndis\NET_LUID_LH.ahk" { NET_LUID_LH }
#Import "..\..\Networking\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains a table of anycast IP address entries.
 * @remarks
 * The <b>MIB_ANYCASTIPADDRESS_TABLE</b> structure is defined on Windows Vista and later. 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getanycastipaddresstable">GetAnycastIpAddressTable</a> function enumerates the anycast IP addresses on a local system and returns this information in a <b>MIB_ANYCASTIPADDRESS_TABLE</b> structure. 
 * 
 * 
 * 
 * The <b>MIB_ANYCASTIPADDRESS_TABLE</b> structure may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> array entry in the <b>Table</b> member. Padding for alignment may also be present between the <b>MIB_ANYCASTIPADDRESS_ROW</b> array entries in the <b>Table</b> member. Any access to a <b>MIB_ANYCASTIPADDRESS_ROW</b> array entry should assume  padding may exist. 
 * 
 * 
 * 
 * Note that the <i>Netioapi.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Netioapi.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-mib_anycastipaddress_table
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_ANYCASTIPADDRESS_TABLE {
    #StructPack 8

    /**
     * A value that specifies the number of anycast IP address entries in the array.
     */
    NumEntries : UInt32

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_anycastipaddress_row">MIB_ANYCASTIPADDRESS_ROW</a> structures containing anycast IP address entries.
     */
    Table : MIB_ANYCASTIPADDRESS_ROW[1]

}
