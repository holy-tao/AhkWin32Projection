#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIB_IPMCAST_BOUNDARY.ahk" { MIB_IPMCAST_BOUNDARY }

/**
 * Contains a list of a router's scoped IPv4 multicast address boundaries.
 * @remarks
 * This structure does not have a fixed size. Use the <b>SIZEOF_BOUNDARY_TABLE(X)</b> macro to determine the size of this structure. This macro is defined in the <i>Iprtrmib.h</i> header file.
 * 
 * Note that the <i>Iprtrmib.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Iprtrmib.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/iprtrmib/ns-iprtrmib-mib_ipmcast_boundary_table
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IPMCAST_BOUNDARY_TABLE {
    #StructPack 4

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-mib_ipmcast_boundary">MIB_IPMCAST_BOUNDARY</a> structures listed in <b>table[]</b>.
     */
    dwNumEntries : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/iprtrmib/ns-iprtrmib-mib_ipmcast_boundary">MIB_IPMCAST_BOUNDARY</a> structures which collectively define the set of scoped IPv4 multicast address boundaries on a router.
     */
    table : MIB_IPMCAST_BOUNDARY[1]

}
