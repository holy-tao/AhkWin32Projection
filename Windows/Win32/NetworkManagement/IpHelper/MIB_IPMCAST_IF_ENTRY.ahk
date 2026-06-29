#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores information about an IP multicast interface.
 * @remarks
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed. This  structure is defined in the <i>Ipmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mib_ipmcast_if_entry
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IPMCAST_IF_ENTRY {
    #StructPack 4

    /**
     * The index of this interface.
     */
    dwIfIndex : UInt32

    /**
     * The time-to-live value for this interface.
     */
    dwTtl : UInt32

    /**
     * The multicast routing protocol that owns this interface.
     */
    dwProtocol : UInt32

    /**
     * The rate limit of this interface.
     */
    dwRateLimit : UInt32

    /**
     * The number of octets of multicast data received through this interface.
     */
    ulInMcastOctets : UInt32

    /**
     * The number of octets of multicast data sent through this interface.
     */
    ulOutMcastOctets : UInt32

}
