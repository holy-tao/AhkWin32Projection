#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Specifies information about the list of nodes sufficient to establish quorum in a majority-of-nodes cluster.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_force_quorum_info
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_FORCE_QUORUM_INFO {
    #StructPack 4

    /**
     * The total size of the structure, including the nodes list.
     */
    dwSize : UInt32

    /**
     * A bit mask representing the maximum assumed node set.
     */
    dwNodeBitMask : UInt32

    /**
     * The number of bits set in the mask
     */
    dwMaxNumberofNodes : UInt32

    /**
     * The names of the nodes that are sufficient to establish quorum in a majority-of-nodes cluster. This list should be comma delimited with no spaces.
     */
    multiszNodeList : WCHAR[1]

}
