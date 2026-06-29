#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores the index of the interface that has the best route to a particular destination IPv4 address.
 * @remarks
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>MIB_BEST_IF</b> structure is defined in the <i>Ipmib.h</i> header file not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i> which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/iprtrmib/ns-iprtrmib-mib_best_if
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_BEST_IF {
    #StructPack 4

    /**
     * Specifies the IPv4 address of the destination.
     */
    dwDestAddr : UInt32

    /**
     * Specifies the index of the interface that has the best route to the destination address specified by the <b>dwDestAddr</b> member.
     */
    dwIfIndex : UInt32

}
