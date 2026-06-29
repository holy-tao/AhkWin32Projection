#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains statistics for the User Datagram Protocol (UDP) running on the local computer. (MIB_UDPSTATS2)
 * @remarks
 * The 
 * 			<a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getudpstatisticsex2">GetUdpStatisticsEx2</a> function returns a pointer to a <b>MIB_UDPSTATS2</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/udpmib/ns-udpmib-mib_udpstats2
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_UDPSTATS2 {
    #StructPack 8

    /**
     * The number of datagrams received.
     */
    dw64InDatagrams : Int64

    /**
     * The number of datagrams received that were discarded because the port specified was invalid.
     */
    dwNoPorts : UInt32

    /**
     * The number of erroneous datagrams  received. This number does not include the value contained by the <b>dwNoPorts</b> member.
     */
    dwInErrors : UInt32

    /**
     * The number of datagrams transmitted.
     */
    dw64OutDatagrams : Int64

    /**
     * The number of entries in the UDP listener table.
     */
    dwNumAddrs : UInt32

}
