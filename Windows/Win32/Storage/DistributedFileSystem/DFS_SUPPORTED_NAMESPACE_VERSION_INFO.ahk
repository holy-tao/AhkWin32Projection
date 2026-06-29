#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains version information for a DFS namespace.
 * @see https://learn.microsoft.com/windows/win32/api/lmdfs/ns-lmdfs-dfs_supported_namespace_version_info
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 */
export default struct DFS_SUPPORTED_NAMESPACE_VERSION_INFO {
    #StructPack 8

    /**
     * The major version of the domain-based DFS namespace.
     */
    DomainDfsMajorVersion : UInt32

    /**
     * The minor version of the domain-based DFS namespace.
     */
    DomainDfsMinorVersion : UInt32

    /**
     * Specifies a set of flags that describe specific capabilities of a domain-based DFS namespace.
     */
    DomainDfsCapabilities : Int64

    /**
     * The major version of the stand-alone DFS namespace.
     */
    StandaloneDfsMajorVersion : UInt32

    /**
     * The minor version of the stand-alone DFS namespace.
     */
    StandaloneDfsMinorVersion : UInt32

    /**
     * Specifies a set of flags that describe specific capabilities of a stand-alone DFS namespace.
     */
    StandaloneDfsCapabilities : Int64

}
