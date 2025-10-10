#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the origin of DFS namespace version information.
 * @see https://docs.microsoft.com/windows/win32/api//lmdfs/ne-lmdfs-dfs_namespace_version_origin
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @version v4.0.30319
 */
class DFS_NAMESPACE_VERSION_ORIGIN{

    /**
     * The version information specifies the maximum version that the server and the Active Directory Domain Service (AD DS) domain can support.
     * @type {Integer (Int32)}
     */
    static DFS_NAMESPACE_VERSION_ORIGIN_COMBINED => 0

    /**
     * The version information specifies the maximum version that the server can support.
     * @type {Integer (Int32)}
     */
    static DFS_NAMESPACE_VERSION_ORIGIN_SERVER => 1

    /**
     * The version information specifies the maximum version that the AD DS domain can support.
     * @type {Integer (Int32)}
     */
    static DFS_NAMESPACE_VERSION_ORIGIN_DOMAIN => 2
}
