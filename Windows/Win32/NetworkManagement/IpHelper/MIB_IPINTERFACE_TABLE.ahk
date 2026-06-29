#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIB_IPINTERFACE_ROW.ahk" { MIB_IPINTERFACE_ROW }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Networking\WinSock\NL_ROUTER_DISCOVERY_BEHAVIOR.ahk" { NL_ROUTER_DISCOVERY_BEHAVIOR }
#Import "..\..\Networking\WinSock\NL_LINK_LOCAL_ADDRESS_BEHAVIOR.ahk" { NL_LINK_LOCAL_ADDRESS_BEHAVIOR }
#Import "..\..\Networking\WinSock\NL_INTERFACE_OFFLOAD_ROD.ahk" { NL_INTERFACE_OFFLOAD_ROD }
#Import "..\Ndis\NET_LUID_LH.ahk" { NET_LUID_LH }
#Import "..\..\Networking\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }

/**
 * Contains a table of IP interface entries.
 * @remarks
 * The <b>MIB_IPINTERFACE_TABLE</b> structure is defined on Windows Vista and later. 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipinterfacetable">GetIpInterfaceTable</a> function enumerates the IP interface entries on a local system and returns this information in a <b>MIB_IPINTERFACE_TABLE</b> structure. 
 * 
 * 
 * 
 * The <b>MIB_IPINTERFACE_TABLE</b> structure may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> array entry in the <b>Table</b> member. Padding for alignment may also be present between the <b>MIB_IPINTERFACE_ROW</b> array entries in the <b>Table</b> member. Any access to a <b>MIB_IPINTERFACE_ROW</b> array entry should assume  padding may exist. 
 * 
 * 
 * 
 * Note that the <i>Netioapi.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Netioapi.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-mib_ipinterface_table
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IPINTERFACE_TABLE {
    #StructPack 8

    /**
     * The number of IP interface entries in the array.
     */
    NumEntries : UInt32

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ipinterface_row">MIB_IPINTERFACE_ROW</a> structures that contain IP interface entries.
     */
    Table : MIB_IPINTERFACE_ROW[1]

}
