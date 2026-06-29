#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIB_IPSTATS_FORWARDING.ahk" { MIB_IPSTATS_FORWARDING }

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
 */
export default struct MIB_IPSTATS_LH {
    #StructPack 4

    dwForwarding : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The default initial time-to-live (TTL) for datagrams originating on a particular computer.
     * 
     * This member can be set to <b>MIB_USE_CURRENT_TTL</b> to use the current default TTL value when setting the forwarding and time-to-live (TTL) options using the <b>SetIpStatistics</b> and <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setipstatisticsex">SetIpStatisticsEx</a> functions.
     */
    dwDefaultTTL : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of datagrams received.
     */
    dwInReceives : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of datagrams received that have header errors.
     */
    dwInHdrErrors : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of datagrams received that have address errors.
     */
    dwInAddrErrors : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of datagrams forwarded.
     */
    dwForwDatagrams : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of datagrams received that have an unknown protocol.
     */
    dwInUnknownProtos : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of received datagrams discarded.
     */
    dwInDiscards : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of received datagrams delivered.
     */
    dwInDelivers : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of outgoing datagrams that IP is requested to transmit. This number does not include forwarded datagrams.
     */
    dwOutRequests : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of outgoing datagrams discarded.
     */
    dwRoutingDiscards : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of transmitted datagrams discarded.
     */
    dwOutDiscards : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of datagrams for which this computer did not have a route to the destination IP address. These datagrams were discarded.
     */
    dwOutNoRoutes : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The amount of time allowed for all pieces of a fragmented datagram to arrive. If all pieces do not arrive within this time, the datagram is discarded.
     */
    dwReasmTimeout : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of datagrams that require re-assembly.
     */
    dwReasmReqds : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of datagrams that were successfully reassembled.
     */
    dwReasmOks : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of datagrams that cannot be reassembled.
     */
    dwReasmFails : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of datagrams that were fragmented successfully.
     */
    dwFragOks : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of datagrams that have not been fragmented because the IP header specifies no fragmentation. These datagrams are discarded.
     */
    dwFragFails : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of fragments created.
     */
    dwFragCreates : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of interfaces.
     */
    dwNumIf : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of IP addresses associated with this computer.
     */
    dwNumAddr : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of routes in the IP routing table.
     */
    dwNumRoutes : UInt32

    static __New() {
        DefineProp(this.Prototype, 'Forwarding', { type: MIB_IPSTATS_FORWARDING, offset: 0 })
        this.DeleteProp("__New")
    }
}
