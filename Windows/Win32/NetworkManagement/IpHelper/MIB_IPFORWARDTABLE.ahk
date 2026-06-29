#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIB_IPFORWARD_TYPE.ahk" { MIB_IPFORWARD_TYPE }
#Import ".\MIB_IPFORWARDROW.ahk" { MIB_IPFORWARDROW }
#Import "..\..\Networking\WinSock\NL_ROUTE_PROTOCOL.ahk" { NL_ROUTE_PROTOCOL }

/**
 * Contains a table of IPv4 route entries.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipforwardtable">GetIpForwardTable</a> function enumerates the IPv4 route entries on a local system and returns this information in a <b>MIB_IPFORWARDTABLE</b> structure. 
 * 
 * 
 * 
 * The <b>MIB_IPFORWARDTABLE</b> structure may contain padding for alignment between the <b>dwNumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> array entry in the <b>table</b> member. Padding for alignment may also be present between the <b>MIB_IPFORWARDROW</b> array entries in the <b>table</b> member. Any access to a <b>MIB_IPFORWARDROW</b> array entry should assume  padding may exist. 
 * 
 * 
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed. This  structure is defined in the <i>Ipmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mib_ipforwardtable
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IPFORWARDTABLE {
    #StructPack 4

    /**
     * The number of route entries in the table.
     */
    dwNumEntries : UInt32

    /**
     * A pointer to a table of route entries implemented as an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipforwardrow">MIB_IPFORWARDROW</a> structures.
     */
    table : MIB_IPFORWARDROW[1]

}
