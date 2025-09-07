#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * MIB_IPMCAST_OIF_STATS_W2K (ipmib.h) stores the statistics that are associated with an outgoing multicast interface.
 * @remarks
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Server 2008and later, the organization of header files has changed. This  structure is defined in the <i>Ipmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mib_ipmcast_oif_stats_w2k
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IPMCAST_OIF_STATS_W2K extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the outgoing interface to which these statistics are related.
     * @type {Integer}
     */
    dwOutIfIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the address of the next hop that corresponds to <b>dwOutIfIndex</b>. The <b>dwOutIfIndex</b> and <b>dwIfNextHopIPAddr</b> members uniquely identify a next hop on point-to-multipoint interfaces, where one interface connects to multiple networks. Examples of point-to-multipoint interfaces include non-broadcast multiple-access (NBMA) interfaces, and the internal interface on which all dial-up clients connect. 
     * 
     * For Ethernet and other broadcast interfaces, specify zero. Also specify zero for point-to-point interfaces, which are identified by only <b>dwOutIfIndex</b>.
     * @type {Integer}
     */
    dwNextHopAddr {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>PVOID</b>
     * 
     * Reserved. This member should be <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    pvDialContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Specifies the number of packets on this outgoing interface that were discarded because the packet's time-to-live (TTL) value was too low.
     * @type {Integer}
     */
    ulTtlTooLow {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Specifies the number of packets that required fragmentation when they were forwarded on this interface.
     * @type {Integer}
     */
    ulFragNeeded {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Specifies the number of packets that were forwarded out this interface.
     * @type {Integer}
     */
    ulOutPackets {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Specifies the number of packets that were discarded on this interface.
     * @type {Integer}
     */
    ulOutDiscards {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
