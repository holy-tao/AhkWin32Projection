#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IP_MCAST_COUNTER_INFO structure stores statistical information about Multicast traffic.
 * @remarks
 * 
  * This structure is defined in the <i>Ipexport.h</i> header file which is automatically included in the <i>Iphlpapi.h</i> header file. The <i>Ipexport.h</i> header file should never be used directly.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ipexport/ns-ipexport-ip_mcast_counter_info
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class IP_MCAST_COUNTER_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The number of  multicast octets received.
     * @type {Integer}
     */
    InMcastOctets {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of  multicast octets transmitted.
     * @type {Integer}
     */
    OutMcastOctets {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of multicast packets received.
     * @type {Integer}
     */
    InMcastPkts {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of multicast packets transmitted.
     * @type {Integer}
     */
    OutMcastPkts {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
