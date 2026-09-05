#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the origin of DFS namespace version information.
 * @see https://learn.microsoft.com/windows/win32/api/lmdfs/ne-lmdfs-dfs_namespace_version_origin
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 */
class DFS_NAMESPACE_VERSION_ORIGIN extends Win32Enum {

    /**
     * The version information specifies the maximum version that the server and the Active Directory Domain Service (AD DS) domain can support.
     * Native name: DFS_NAMESPACE_VERSION_ORIGIN_COMBINED
     * @type {Integer (Int32)}
     */
    static COMBINED => 0

    /**
     * The version information specifies the maximum version that the server can support.
     * Native name: DFS_NAMESPACE_VERSION_ORIGIN_SERVER
     * @type {Integer (Int32)}
     */
    static SERVER => 1

    /**
     * The version information specifies the maximum version that the AD DS domain can support.
     * Native name: DFS_NAMESPACE_VERSION_ORIGIN_DOMAIN
     * @type {Integer (Int32)}
     */
    static DOMAIN => 2
}
