#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\IN_ADDR.ahk" { IN_ADDR }
#Import "..\..\Networking\WinSock\SOCKADDR_INET.ahk" { SOCKADDR_INET }
#Import "..\..\Networking\WinSock\SOCKADDR_IN.ahk" { SOCKADDR_IN }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }
#Import "..\..\Networking\WinSock\SOCKADDR_IN6.ahk" { SOCKADDR_IN6 }
#Import "..\..\Networking\WinSock\SCOPE_ID.ahk" { SCOPE_ID }
#Import "..\Ndis\NET_LUID_LH.ahk" { NET_LUID_LH }
#Import "..\..\Networking\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Stores information about an IP path entry.
 * @remarks
 * The <b>MIB_IPPATH_ROW</b> structure is defined on Windows Vista and later. 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getippathtable">GetIpPathTable</a> function enumerates the IP path entries on a local system and returns this information in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ippath_table">MIB_IPPATH_TABLE</a> structure as an array of <b>MIB_IPPATH_ROW</b> entries. 
 * 
 * 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getippathentry">GetIpPathEntry</a> function retrieves a single IP path entry and returns this information in a <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/ns-netioapi-mib_ippath_table">MIB_IPPATH_TABLE</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-mib_ippath_row
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IPPATH_ROW {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-sockaddr_inet">SOCKADDR_INET</a></b>
     * 
     * The source IP address for this IP path entry.
     */
    Source : SOCKADDR_INET

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-sockaddr_inet">SOCKADDR_INET</a></b>
     * 
     * The destination IP address for this IP path entry.
     */
    Destination : SOCKADDR_INET

    /**
     * Type: <b>NET_LUID</b>
     * 
     * The locally unique identifier (LUID) for the network interface associated with this IP path entry.
     */
    InterfaceLuid : NET_LUID_LH

    /**
     * Type: <b>NET_IFINDEX</b>
     * 
     * The local index value for the network interface associated with this IP path entry. This index value may change when a network adapter is disabled and then enabled, or under other circumstances, and should not be considered persistent.
     */
    InterfaceIndex : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-sockaddr_inet">SOCKADDR_INET</a></b>
     * 
     * The current IP address of the next system or gateway en route. This member can change over the lifetime of a path.
     */
    CurrentNextHop : SOCKADDR_INET

    /**
     * Type: <b>ULONG</b>
     * 
     * The maximum transmission unit (MTU) size, in bytes, to the destination IP address for this IP path entry.
     */
    PathMtu : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * The estimated mean round-trip time (RTT), in milliseconds, to the destination IP address for this IP path entry.
     */
    RttMean : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * The estimated mean deviation for the round-trip time (RTT), in milliseconds, to the destination IP address for this IP path entry.
     */
    RttDeviation : UInt32

    LastReachable : UInt32

    /**
     * Type: <b>BOOLEAN</b>
     * 
     * A value that indicates if the destination IP address is reachable for this IP path entry.
     */
    IsReachable : BOOLEAN

    /**
     * Type: <b>ULONG64</b>
     * 
     * The estimated speed in bits per second of the transmit link to the destination IP address for this IP path entry.
     */
    LinkTransmitSpeed : Int64

    /**
     * Type: <b>ULONG64</b>
     * 
     * The estimated speed in bits per second of the receive link from the destination IP address for this IP path entry.
     */
    LinkReceiveSpeed : Int64

    static __New() {
        DefineProp(this.Prototype, 'LastUnreachable', { type: UInt32, offset: 176 })
        this.DeleteProp("__New")
    }
}
