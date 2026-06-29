#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the DFS metadata version and capabilities of an existing DFS namespace.
 * @see https://learn.microsoft.com/windows/win32/api/lmdfs/ns-lmdfs-dfs_info_50
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 */
export default struct DFS_INFO_50 {
    #StructPack 8

    /**
     * The major version of the DFS metadata.
     */
    NamespaceMajorVersion : UInt32

    /**
     * The minor version of the DFS metadata.
     */
    NamespaceMinorVersion : UInt32

    /**
     * Specifies a set of flags that describe specific capabilities of a DFS namespace.
     */
    NamespaceCapabilities : Int64

}
