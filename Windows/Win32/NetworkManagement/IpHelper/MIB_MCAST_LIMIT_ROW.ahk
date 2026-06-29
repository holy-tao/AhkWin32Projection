#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MIB_MCAST_LIMIT_ROW structure contains the configurable limit information from a corresponding MIB_IPMCAST_IF_ENTRY structure.
 * @see https://learn.microsoft.com/windows/win32/api/iprtrmib/ns-iprtrmib-mib_mcast_limit_row
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_MCAST_LIMIT_ROW {
    #StructPack 4

    /**
     * The time-to-live value for a multicast interface.
     */
    dwTtl : UInt32

    /**
     * The rate limit for a multicast interface.
     */
    dwRateLimit : UInt32

}
