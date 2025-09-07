#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the DFS metadata version and capabilities of an existing DFS namespace.
 * @see https://learn.microsoft.com/windows/win32/api/lmdfs/ns-lmdfs-dfs_info_50
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @version v4.0.30319
 */
class DFS_INFO_50 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The major version of the DFS metadata.
     * @type {Integer}
     */
    NamespaceMajorVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The minor version of the DFS metadata.
     * @type {Integer}
     */
    NamespaceMinorVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies a set of flags that describe specific capabilities of a DFS namespace.
     * @type {Integer}
     */
    NamespaceCapabilities {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
