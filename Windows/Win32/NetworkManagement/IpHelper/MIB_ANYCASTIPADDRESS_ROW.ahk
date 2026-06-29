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
 * Stores information about an anycast IP address.
 * @remarks
 * The <b>MIB_ANYCASTIPADDRESS_ROW</b> structure is defined on Windows Vista and later. 
 * 
 * Note that the <i>Netioapi.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Netioapi.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-mib_anycastipaddress_row
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_ANYCASTIPADDRESS_ROW {
    #StructPack 8

    /**
     * The anycast IP address. This member can be an IPv6 address or an IPv4 address.
     */
    Address : SOCKADDR_INET

    /**
     * The locally unique identifier (LUID) for the network interface associated with this IP address.
     */
    InterfaceLuid : NET_LUID_LH

    /**
     * The local index value for the network interface associated with this IP address. This index value may change when a network adapter is disabled and then enabled, or under other circumstances, and should not be considered persistent.
     */
    InterfaceIndex : UInt32

    /**
     * The scope ID of the anycast IP address. This member is applicable only to an IPv6 address. This member cannot be set. It is automatically determined by the interface on which the address was added.
     */
    ScopeId : SCOPE_ID

}
