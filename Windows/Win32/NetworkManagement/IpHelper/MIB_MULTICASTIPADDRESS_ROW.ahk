#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\IN_ADDR.ahk" { IN_ADDR }
#Import "..\..\Networking\WinSock\SOCKADDR_INET.ahk" { SOCKADDR_INET }
#Import "..\..\Networking\WinSock\SOCKADDR_IN.ahk" { SOCKADDR_IN }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }
#Import "..\..\Networking\WinSock\SOCKADDR_IN6.ahk" { SOCKADDR_IN6 }
#Import "..\..\Networking\WinSock\SCOPE_ID.ahk" { SCOPE_ID }
#Import "..\Ndis\NET_LUID_LH.ahk" { NET_LUID_LH }
#Import "..\..\Networking\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Stores information about a multicast IP address.
 * @remarks
 * The <b>MIB_MULTICASTIPADDRESS_ROW</b> structure is defined on Windows Vista and later. 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getmulticastipaddresstable">GetMulticastIpAddressTable</a> function enumerates the multicast IP addresses on a local system and returns this information in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_multicastipaddress_table">MIB_MULTICASTIPADDRESS_TABLE</a> structure. The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getmulticastipaddressentry">GetMulticastIpAddressEntry</a> function retrieves a single multicast IP address and returns this information in a <b>MIB_MULTICASTIPADDRESS_ROW</b> structure.
 * 
 * Note that the <i>Netioapi.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Netioapi.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-mib_multicastipaddress_row
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_MULTICASTIPADDRESS_ROW {
    #StructPack 8

    /**
     * The multicast IP address. This member can be an IPv6 address or an IPv4 address.
     */
    Address : SOCKADDR_INET

    /**
     * The local index value for the network interface associated with this IP address. This index value may change when a network adapter is disabled and then enabled, or under other circumstances, and should not be considered persistent.
     */
    InterfaceIndex : UInt32

    /**
     * The locally unique identifier (LUID) for the network interface associated with this IP address.
     */
    InterfaceLuid : NET_LUID_LH

    /**
     * The scope ID of the multicast IP address. This member is applicable only to an IPv6 address. This member cannot be set. It is automatically determined by the interface on which the address was added.
     */
    ScopeId : SCOPE_ID

}
