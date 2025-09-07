#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains statistics for the User Datagram Protocol (UDP) running on the local computer. (MIB_UDPSTATS)
 * @remarks
 * The 
  * 			<a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getudpstatistics">GetUdpStatistics</a> function returns a pointer to a <b>MIB_UDPSTATS</b> structure. 
  * 
  * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed. This  structure is defined in the <i>Udpmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Udpmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Udpmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/udpmib/ns-udpmib-mib_udpstats
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_UDPSTATS extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The number of datagrams received.
     * @type {Integer}
     */
    dwInDatagrams {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of datagrams received that were discarded because the port specified was invalid.
     * @type {Integer}
     */
    dwNoPorts {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of erroneous datagrams  received. This number does not include the value contained by the <b>dwNoPorts</b> member.
     * @type {Integer}
     */
    dwInErrors {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of datagrams transmitted.
     * @type {Integer}
     */
    dwOutDatagrams {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The number of entries in the UDP listener table.
     * @type {Integer}
     */
    dwNumAddrs {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
