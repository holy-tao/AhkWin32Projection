#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains version information for a DFS namespace.
 * @see https://docs.microsoft.com/windows/win32/api//lmdfs/ns-lmdfs-dfs_supported_namespace_version_info
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @version v4.0.30319
 */
class DFS_SUPPORTED_NAMESPACE_VERSION_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The major version of the domain-based DFS namespace.
     * @type {Integer}
     */
    DomainDfsMajorVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The minor version of the domain-based DFS namespace.
     * @type {Integer}
     */
    DomainDfsMinorVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies a set of flags that describe specific capabilities of a domain-based DFS namespace.
     * @type {Integer}
     */
    DomainDfsCapabilities {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The major version of the stand-alone DFS namespace.
     * @type {Integer}
     */
    StandaloneDfsMajorVersion {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The minor version of the stand-alone DFS namespace.
     * @type {Integer}
     */
    StandaloneDfsMinorVersion {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Specifies a set of flags that describe specific capabilities of a stand-alone DFS namespace.
     * @type {Integer}
     */
    StandaloneDfsCapabilities {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
