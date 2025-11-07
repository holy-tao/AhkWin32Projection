#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MIB_IPMCAST_OIF_STATS_LH.ahk

/**
 * Stores the statistics associated with a Multicast Forwarding Entry (MFE).
 * @remarks
 * 
 * The 
 * <b>MIB_IPMCAST_MFE_STATS</b> structure does not have a fixed size. Use the <b>SIZEOF_MIB_MFE_STATS(X)</b> macro to determine the size of this structure. This macro is defined in the Iprtrmib.h header file.
 * 
 * The <b>dwRouteProtocol</b>, <b>dwRouteNetwork</b>, and <b>dwRouteMask</b> members uniquely identify the route to which this MFE is related.
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vistaand later, the organization of header files has changed. This  structure is defined in the <i>Ipmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ipmib/ns-ipmib-mib_ipmcast_mfe_stats
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IPMCAST_MFE_STATS extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The multicast group for this MFE. A value of zero indicates a wildcard group.
     * @type {Integer}
     */
    dwGroup {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The range of source addresses for this MFE. A value of zero indicates a wildcard source.
     * @type {Integer}
     */
    dwSource {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The IPv4 subnet mask that corresponds to <b>dwSourceAddr</b>. The <b>dwSourceAddr</b> and <b>dwSourceMask</b> members are used together to define a range of sources.
     * @type {Integer}
     */
    dwSrcMask {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The upstream neighbor that is related to this MFE.
     * @type {Integer}
     */
    dwUpStrmNgbr {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The index of the incoming interface to which this MFE is related.
     * @type {Integer}
     */
    dwInIfIndex {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The routing protocol that owns the incoming interface to which this MFE is related.
     * @type {Integer}
     */
    dwInIfProtocol {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The client that created the route.
     * @type {Integer}
     */
    dwRouteProtocol {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The address associated with the route referred to by <b>dwRouteProtocol</b>.
     * @type {Integer}
     */
    dwRouteNetwork {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The mask associated with the route referred to by <b>dwRouteProtocol</b>.
     * @type {Integer}
     */
    dwRouteMask {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The time, in 100ths of a seconds, since the MFE was created.
     * @type {Integer}
     */
    ulUpTime {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The time, in 100ths of a seconds, until the MFE will be deleted. A value of zero is specified if the MFE is not subject to aging requirements.
     * @type {Integer}
     */
    ulExpiryTime {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of interfaces in the outgoing interface list for this MFE.
     * @type {Integer}
     */
    ulNumOutIf {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of packets that have been forwarded that matched this MFE.
     * @type {Integer}
     */
    ulInPkts {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of octets of data forwarded that match this MFE.
     * @type {Integer}
     */
    ulInOctets {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of packets matching this MFE that were dropped due to an incoming interface check.
     * @type {Integer}
     */
    ulPktsDifferentIf {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of packets matching this MFE that were dropped due to a queue overflow. There is one queue per MFE.
     * @type {Integer}
     */
    ulQueueOverflow {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Type: <b>MIB_IPMCAST_OIF_STATS[ANY_SIZE]</b>
     * 
     * A pointer to a table of outgoing interface statistics that are implemented as an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipmcast_oif_stats_lh">MIB_IPMCAST_OIF_STATS</a> structures. The number of entries in the table is specified by the value of the <b>ulNumOutIf</b> member.
     * @type {Array<MIB_IPMCAST_OIF_STATS_LH>}
     */
    rgmiosOutStats{
        get {
            if(!this.HasProp("__rgmiosOutStatsProxyArray"))
                this.__rgmiosOutStatsProxyArray := Win32FixedArray(this.ptr + 64, 1, MIB_IPMCAST_OIF_STATS_LH, "")
            return this.__rgmiosOutStatsProxyArray
        }
    }
}
