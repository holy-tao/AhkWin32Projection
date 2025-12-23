#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_IN.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include ..\..\Networking\WinSock\SCOPE_ID.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_IN6.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_INET.ahk
#Include ..\Ndis\NET_LUID_LH.ahk

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
 * @version v4.0.30319
 */
class MIB_IPPATH_ROW extends Win32Struct
{
    static sizeof => 224

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-sockaddr_inet">SOCKADDR_INET</a></b>
     * 
     * The source IP address for this IP path entry.
     * @type {SOCKADDR_INET}
     */
    Source{
        get {
            if(!this.HasProp("__Source"))
                this.__Source := SOCKADDR_INET(0, this)
            return this.__Source
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-sockaddr_inet">SOCKADDR_INET</a></b>
     * 
     * The destination IP address for this IP path entry.
     * @type {SOCKADDR_INET}
     */
    Destination{
        get {
            if(!this.HasProp("__Destination"))
                this.__Destination := SOCKADDR_INET(56, this)
            return this.__Destination
        }
    }

    /**
     * Type: <b>NET_LUID</b>
     * 
     * The locally unique identifier (LUID) for the network interface associated with this IP path entry.
     * @type {NET_LUID_LH}
     */
    InterfaceLuid{
        get {
            if(!this.HasProp("__InterfaceLuid"))
                this.__InterfaceLuid := NET_LUID_LH(112, this)
            return this.__InterfaceLuid
        }
    }

    /**
     * Type: <b>NET_IFINDEX</b>
     * 
     * The local index value for the network interface associated with this IP path entry. This index value may change when a network adapter is disabled and then enabled, or under other circumstances, and should not be considered persistent.
     * @type {Integer}
     */
    InterfaceIndex {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-sockaddr_inet">SOCKADDR_INET</a></b>
     * 
     * The current IP address of the next system or gateway en route. This member can change over the lifetime of a path.
     * @type {SOCKADDR_INET}
     */
    CurrentNextHop{
        get {
            if(!this.HasProp("__CurrentNextHop"))
                this.__CurrentNextHop := SOCKADDR_INET(132, this)
            return this.__CurrentNextHop
        }
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The maximum transmission unit (MTU) size, in bytes, to the destination IP address for this IP path entry.
     * @type {Integer}
     */
    PathMtu {
        get => NumGet(this, 188, "uint")
        set => NumPut("uint", value, this, 188)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The estimated mean round-trip time (RTT), in milliseconds, to the destination IP address for this IP path entry.
     * @type {Integer}
     */
    RttMean {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The estimated mean deviation for the round-trip time (RTT), in milliseconds, to the destination IP address for this IP path entry.
     * @type {Integer}
     */
    RttDeviation {
        get => NumGet(this, 196, "uint")
        set => NumPut("uint", value, this, 196)
    }

    /**
     * @type {Integer}
     */
    LastReachable {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * @type {Integer}
     */
    LastUnreachable {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * Type: <b>BOOLEAN</b>
     * 
     * A value that indicates if the destination IP address is reachable for this IP path entry.
     * @type {BOOLEAN}
     */
    IsReachable {
        get => NumGet(this, 204, "char")
        set => NumPut("char", value, this, 204)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The estimated speed in bits per second of the transmit link to the destination IP address for this IP path entry.
     * @type {Integer}
     */
    LinkTransmitSpeed {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The estimated speed in bits per second of the receive link from the destination IP address for this IP path entry.
     * @type {Integer}
     */
    LinkReceiveSpeed {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }
}
