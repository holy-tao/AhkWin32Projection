#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information for a MIB opaque query.
 * @see https://learn.microsoft.com/windows/win32/api/iprtrmib/ns-iprtrmib-mib_opaque_query
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_OPAQUE_QUERY {
    #StructPack 4

    /**
     * The identifier of the MIB object to query.
     */
    dwVarId : UInt32

    /**
     * The index of the MIB object to query.
     */
    rgdwVarIndex : UInt32[1]

}
