#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * MIB_IPADDRROW_W2K (ipmib.h) specifies information for a particular IPv4 address in the MIB_IPADDRTABLE structure.
 * @remarks
 * On Windows XP and later, the <b>dwIndex</b> member of the <b>MIB_IPADDRROW</b> structure has a data type of <b>IF_INDEX</b>. The <b>wType</b> member is only available  on Windows XP and later. On Windows 2000 and earlier, this member is defined as <b>Unused2</b>.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipaddrtable">GetIpAddrTable</a> function retrieves the interface–to–IPv4 address mapping table on a local computer and returns this information in an <a href="https://docs.microsoft.com/windows/desktop/api/ipmib/ns-ipmib-mib_ipaddrtable">MIB_IPADDRTABLE</a> structure. The <b>table</b> member in the <b>MIB_IPADDRTABLE</b> structure contains an array of <b>MIB_IPADDRROW</b> entries.
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>MIB_IPADDRROW</b> structure is defined in the <i>Ipmib.h</i> header file not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ipmib.h</i> header file is automatically included in <i>Iprtrmib.h</i> which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Ipmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ipmib/ns-ipmib-mib_ipaddrrow_w2k
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IPADDRROW_W2K {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The IPv4 address in network byte order.
     */
    dwAddr : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The index of the interface associated with this IPv4 address.
     */
    dwIndex : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The subnet mask for the IPv4 address in network byte order.
     */
    dwMask : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The broadcast address in network byte order. A broadcast address is typically the IPv4 address with the host portion set to either all zeros or all ones.
     * 
     * The proper value for this member is not returned by the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipaddrtable">GetIpAddrTable</a> function.
     */
    dwBCastAddr : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum re-assembly size for received datagrams.
     */
    dwReasmSize : UInt32

    /**
     * Type: <b>unsigned short</b>
     * 
     * This member is reserved.
     */
    unused1 : UInt16

    /**
     * Type: <b>unsigned short</b>
     * 
     * This member is reserved.
     */
    unused2 : UInt16

}
