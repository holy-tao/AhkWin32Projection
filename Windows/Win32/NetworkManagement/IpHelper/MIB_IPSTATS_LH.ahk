#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * MIB_IPSTATS_LH (ipmib.h) stores information about the IP protocol running on a particular computer.
 * @remarks
 * The 
 * <b>MIB_IPSTATS</b> structure stores information per protocol (IPv4 or IPv6).
 * 
 * The <b>dwForwarding</b> member specifies the per-protocol forwarding state for IPv4 or IPv6, not  the forwarding state for an interface. The forwarding state of each interface state is the state that is in affect for that interface. The per-protocol state returned by the <b>GetIpStatistics</b> or the <b>GetIpStatisticsEx</b> function is not the forwarding state in affect. The <b>dwForwarding</b> member exists to serve two purposes:
 * 
 * <ul>
 * <li>Provides a default value for the forwarding state when a new interface is created with no specific forwarding state (neither disabled nor enabled) . This value is inherited per-protocol state.</li>
 * <li>Provides a value set by  by  a domain administrator to enable or disable a per-protocol forwarding state. The forwarding states of all interfaces using that protocol are also enabled or disabled.
 * </li>
 * </ul>
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>MIB_IPSTATS</b> structure is defined in the <i>Ipmib.h</i> header file not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i> which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mib_ipstats_lh
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IPSTATS_LH extends Win32Struct
{
    static sizeof => 92

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwForwarding {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Forwarding {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The default initial time-to-live (TTL) for datagrams originating on a particular computer.
     * 
     * This member can be set to <b>MIB_USE_CURRENT_TTL</b> to use the current default TTL value when setting the forwarding and time-to-live (TTL) options using the <b>SetIpStatistics</b> and <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setipstatisticsex">SetIpStatisticsEx</a> functions.
     * @type {Integer}
     */
    dwDefaultTTL {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of datagrams received.
     * @type {Integer}
     */
    dwInReceives {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of datagrams received that have header errors.
     * @type {Integer}
     */
    dwInHdrErrors {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of datagrams received that have address errors.
     * @type {Integer}
     */
    dwInAddrErrors {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of datagrams forwarded.
     * @type {Integer}
     */
    dwForwDatagrams {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of datagrams received that have an unknown protocol.
     * @type {Integer}
     */
    dwInUnknownProtos {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of received datagrams discarded.
     * @type {Integer}
     */
    dwInDiscards {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of received datagrams delivered.
     * @type {Integer}
     */
    dwInDelivers {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of outgoing datagrams that IP is requested to transmit. This number does not include forwarded datagrams.
     * @type {Integer}
     */
    dwOutRequests {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of outgoing datagrams discarded.
     * @type {Integer}
     */
    dwRoutingDiscards {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of transmitted datagrams discarded.
     * @type {Integer}
     */
    dwOutDiscards {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of datagrams for which this computer did not have a route to the destination IP address. These datagrams were discarded.
     * @type {Integer}
     */
    dwOutNoRoutes {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The amount of time allowed for all pieces of a fragmented datagram to arrive. If all pieces do not arrive within this time, the datagram is discarded.
     * @type {Integer}
     */
    dwReasmTimeout {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of datagrams that require re-assembly.
     * @type {Integer}
     */
    dwReasmReqds {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of datagrams that were successfully reassembled.
     * @type {Integer}
     */
    dwReasmOks {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of datagrams that cannot be reassembled.
     * @type {Integer}
     */
    dwReasmFails {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of datagrams that were fragmented successfully.
     * @type {Integer}
     */
    dwFragOks {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of datagrams that have not been fragmented because the IP header specifies no fragmentation. These datagrams are discarded.
     * @type {Integer}
     */
    dwFragFails {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of fragments created.
     * @type {Integer}
     */
    dwFragCreates {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of interfaces.
     * @type {Integer}
     */
    dwNumIf {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of IP addresses associated with this computer.
     * @type {Integer}
     */
    dwNumAddr {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of routes in the IP routing table.
     * @type {Integer}
     */
    dwNumRoutes {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }
}
