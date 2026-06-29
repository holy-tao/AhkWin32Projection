#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The IP_MCAST_COUNTER_INFO structure stores statistical information about Multicast traffic.
 * @remarks
 * This structure is defined in the <i>Ipexport.h</i> header file which is automatically included in the <i>Iphlpapi.h</i> header file. The <i>Ipexport.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipexport/ns-ipexport-ip_mcast_counter_info
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct IP_MCAST_COUNTER_INFO {
    #StructPack 8

    /**
     * The number of  multicast octets received.
     */
    InMcastOctets : Int64

    /**
     * The number of  multicast octets transmitted.
     */
    OutMcastOctets : Int64

    /**
     * The number of multicast packets received.
     */
    InMcastPkts : Int64

    /**
     * The number of multicast packets transmitted.
     */
    OutMcastPkts : Int64

}
