#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about an FT (fault tolerant) set. This structure is used by the CLUSPROP_FTSET_INFO structure to create an entry in a value list.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_ftset_info
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_FTSET_INFO {
    #StructPack 4

    /**
     * The root signature of the FT set.
     */
    dwRootSignature : UInt32

    /**
     * The type of fault tolerance that is supported by the FT set.
     */
    dwFtType : UInt32

}
