#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NET_IF_MEDIA_CONNECT_STATE.ahk" { NET_IF_MEDIA_CONNECT_STATE }
#Import "..\Ndis\NET_IF_CONNECTION_TYPE.ahk" { NET_IF_CONNECTION_TYPE }
#Import "..\Ndis\NET_IF_ACCESS_TYPE.ahk" { NET_IF_ACCESS_TYPE }
#Import "..\Ndis\NDIS_PHYSICAL_MEDIUM.ahk" { NDIS_PHYSICAL_MEDIUM }
#Import "..\Ndis\IF_OPER_STATUS.ahk" { IF_OPER_STATUS }
#Import ".\MIB_IF_ROW2.ahk" { MIB_IF_ROW2 }
#Import "..\Ndis\NET_IF_ADMIN_STATUS.ahk" { NET_IF_ADMIN_STATUS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Ndis\NET_IF_DIRECTION_TYPE.ahk" { NET_IF_DIRECTION_TYPE }
#Import "..\Ndis\TUNNEL_TYPE.ahk" { TUNNEL_TYPE }
#Import "..\Ndis\NDIS_MEDIUM.ahk" { NDIS_MEDIUM }
#Import "..\Ndis\NET_LUID_LH.ahk" { NET_LUID_LH }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains a table of logical and physical interface entries.
 * @remarks
 * The <b>MIB_IF_TABLE2</b> structure is defined in Windows Vista and later. 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getiftable2">GetIfTable2</a> and <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getiftable2ex">GetIfTable2Ex</a> functions enumerates the logical and physical interfaces on a local system and returns this information in a <b>MIB_IF_TABLE2</b> structure. 
 * 
 * 
 * 
 * The <b>MIB_IF_TABLE2</b> structure may contain padding for alignment between the <b>NumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> array entry in the <b>Table</b> member. Padding for alignment may also be present between the <b>MIB_IF_ROW2</b> array entries in the <b>Table</b> member. Any access to a <b>MIB_IF_ROW2</b> array entry should assume  padding may exist. 
 * 
 * 
 * 
 * Note that the <i>Netioapi.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Netioapi.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-mib_if_table2
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IF_TABLE2 {
    #StructPack 8

    /**
     * The number of interface entries in the array.
     */
    NumEntries : UInt32

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_if_row2">MIB_IF_ROW2</a> structures containing interface entries.
     */
    Table : MIB_IF_ROW2[1]

}
