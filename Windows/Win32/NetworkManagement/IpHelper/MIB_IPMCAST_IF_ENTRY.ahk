#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores information about an IP multicast interface.
 * @remarks
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vistaand later, the organization of header files has changed. This  structure is defined in the <i>Ipmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ipmib/ns-ipmib-mib_ipmcast_if_entry
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IPMCAST_IF_ENTRY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * The index of this interface.
     * @type {Integer}
     */
    dwIfIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The time-to-live value for this interface.
     * @type {Integer}
     */
    dwTtl {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The multicast routing protocol that owns this interface.
     * @type {Integer}
     */
    dwProtocol {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The rate limit of this interface.
     * @type {Integer}
     */
    dwRateLimit {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The number of octets of multicast data received through this interface.
     * @type {Integer}
     */
    ulInMcastOctets {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of octets of multicast data sent through this interface.
     * @type {Integer}
     */
    ulOutMcastOctets {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
