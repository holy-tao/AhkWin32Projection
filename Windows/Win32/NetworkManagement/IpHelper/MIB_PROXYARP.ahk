#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores information for a Proxy Address Resolution Protocol (PARP) entry.
 * @see https://learn.microsoft.com/windows/win32/api/iprtrmib/ns-iprtrmib-mib_proxyarp
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_PROXYARP {
    #StructPack 4

    /**
     * The IPv4 address for which to act as a proxy.
     */
    dwAddress : UInt32

    /**
     * The subnet mask for the IPv4 address specified by the <b>dwAddress</b> member.
     */
    dwMask : UInt32

    /**
     * The index of the interface on which to act as a proxy for the address specified by the <b>dwAddress</b> member.
     */
    dwIfIndex : UInt32

}
