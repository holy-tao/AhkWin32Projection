#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains statistics for the User Datagram Protocol (UDP) running on the local computer. (MIB_UDPSTATS2)
 * @remarks
 * The 
 * 			<a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getudpstatisticsex2">GetUdpStatisticsEx2</a> function returns a pointer to a <b>MIB_UDPSTATS2</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/udpmib/ns-udpmib-mib_udpstats2
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_UDPSTATS2 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The number of datagrams received.
     * @type {Integer}
     */
    dw64InDatagrams {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of datagrams received that were discarded because the port specified was invalid.
     * @type {Integer}
     */
    dwNoPorts {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of erroneous datagrams  received. This number does not include the value contained by the <b>dwNoPorts</b> member.
     * @type {Integer}
     */
    dwInErrors {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The number of datagrams transmitted.
     * @type {Integer}
     */
    dw64OutDatagrams {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of entries in the UDP listener table.
     * @type {Integer}
     */
    dwNumAddrs {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
