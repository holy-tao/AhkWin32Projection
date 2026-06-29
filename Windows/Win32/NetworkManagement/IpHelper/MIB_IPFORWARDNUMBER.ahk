#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores the number of routes in a particular IP routing table.
 * @remarks
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed. This  structure is defined in the <i>Ipmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mib_ipforwardnumber
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IPFORWARDNUMBER {
    #StructPack 4

    /**
     * Specifies the number of routes in the IP routing table.
     */
    dwValue : UInt32

}
