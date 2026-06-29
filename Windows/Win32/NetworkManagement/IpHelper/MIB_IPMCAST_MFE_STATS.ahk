#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIB_IPMCAST_OIF_STATS_LH.ahk" { MIB_IPMCAST_OIF_STATS_LH }

/**
 * Stores the statistics associated with a Multicast Forwarding Entry (MFE).
 * @remarks
 * The 
 * <b>MIB_IPMCAST_MFE_STATS</b> structure does not have a fixed size. Use the <b>SIZEOF_MIB_MFE_STATS(X)</b> macro to determine the size of this structure. This macro is defined in the Iprtrmib.h header file.
 * 
 * The <b>dwRouteProtocol</b>, <b>dwRouteNetwork</b>, and <b>dwRouteMask</b> members uniquely identify the route to which this MFE is related.
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed. This  structure is defined in the <i>Ipmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mib_ipmcast_mfe_stats
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IPMCAST_MFE_STATS {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The multicast group for this MFE. A value of zero indicates a wildcard group.
     */
    dwGroup : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The range of source addresses for this MFE. A value of zero indicates a wildcard source.
     */
    dwSource : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The IPv4 subnet mask that corresponds to <b>dwSourceAddr</b>. The <b>dwSourceAddr</b> and <b>dwSourceMask</b> members are used together to define a range of sources.
     */
    dwSrcMask : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The upstream neighbor that is related to this MFE.
     */
    dwUpStrmNgbr : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The index of the incoming interface to which this MFE is related.
     */
    dwInIfIndex : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The routing protocol that owns the incoming interface to which this MFE is related.
     */
    dwInIfProtocol : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The client that created the route.
     */
    dwRouteProtocol : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The address associated with the route referred to by <b>dwRouteProtocol</b>.
     */
    dwRouteNetwork : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The mask associated with the route referred to by <b>dwRouteProtocol</b>.
     */
    dwRouteMask : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * The time, in 100ths of a seconds, since the MFE was created.
     */
    ulUpTime : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * The time, in 100ths of a seconds, until the MFE will be deleted. A value of zero is specified if the MFE is not subject to aging requirements.
     */
    ulExpiryTime : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of interfaces in the outgoing interface list for this MFE.
     */
    ulNumOutIf : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of packets that have been forwarded that matched this MFE.
     */
    ulInPkts : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of octets of data forwarded that match this MFE.
     */
    ulInOctets : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of packets matching this MFE that were dropped due to an incoming interface check.
     */
    ulPktsDifferentIf : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of packets matching this MFE that were dropped due to a queue overflow. There is one queue per MFE.
     */
    ulQueueOverflow : UInt32

    /**
     * Type: <b>MIB_IPMCAST_OIF_STATS[ANY_SIZE]</b>
     * 
     * A pointer to a table of outgoing interface statistics that are implemented as an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_oif_stats_lh">MIB_IPMCAST_OIF_STATS</a> structures. The number of entries in the table is specified by the value of the <b>ulNumOutIf</b> member.
     */
    rgmiosOutStats : MIB_IPMCAST_OIF_STATS_LH[1]

}
