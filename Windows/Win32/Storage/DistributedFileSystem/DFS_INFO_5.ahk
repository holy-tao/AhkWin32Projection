#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a Distributed File System (DFS) root or link. This structure contains the name, status, GUID, time-out, namespace/root/link properties, metadata size, and number of targets for the root or link.
 * @remarks
 * 
 * To retrieve information about targets and target priorities, use the 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_info_6">DFS_INFO_6</a> structure. 
 *      <b>DFS_INFO_5</b> is used to specify information about a DFS 
 *      namespace without target information.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//lmdfs/ns-lmdfs-dfs_info_5
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @version v4.0.30319
 */
class DFS_INFO_5 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Pointer to a null-terminated Unicode string that specifies the Universal Naming Convention (UNC) path 
     *        of a DFS root or link.
     * 
     * For a link, the string can be in one of two forms. The first form is as follows:
     * 
     * &#92;&#92;<i>ServerName</i>&#92;<i>DfsName</i>&#92;<i>link_path</i>
     * 
     * where <i>ServerName</i> is the name of the root target server that hosts the stand-alone 
     *        DFS namespace; <i>DfsName</i> is the name of the DFS namespace; and 
     *        <i>link_path</i> is a DFS link.
     * 
     * The second form is as follows:
     * 
     * &#92;&#92;<i>DomainName</i>&#92;<i>DomDfsname</i>&#92;<i>link_path</i>
     * 
     * where <i>DomainName</i> is the name of the domain that hosts the domain-based DFS 
     *        namespace; <i>DomDfsname</i> is the name of the DFS namespace; and 
     *        <i>link_path</i> is a DFS link.
     * 
     * For a root, the string can be in one of two forms:
     * 
     * &#92;&#92;<i>ServerName</i>&#92;<i>DfsName</i>
     * 
     * or
     * 
     * &#92;&#92;<i>DomainName</i>&#92;<i>DomDfsname</i>
     * 
     * where the values of the names are the same as those described previously.
     * @type {PWSTR}
     */
    EntryPath {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a null-terminated Unicode string that contains a comment associated with the DFS root or 
     *       link.
     * @type {PWSTR}
     */
    Comment {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies a set of bit flags that describe the DFS root or link. One 
     *       <b>DFS_VOLUME_STATE</b> flag is set, and one <b>DFS_VOLUME_FLAVOR</b> flag 
     *       is set. For an example that describes the interpretation of the flags, see the Remarks section of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_info_2">DFS_INFO_2</a>.
     * @type {Integer}
     */
    State {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the time-out, in seconds, of the DFS root or link.
     * @type {Integer}
     */
    Timeout {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Specifies the GUID of the DFS root or link.
     * @type {Pointer<Guid>}
     */
    Guid {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Specifies a set of flags describing specific properties of a DFS namespace, root, or link.
     * @type {Integer}
     */
    PropertyFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * For domain-based DFS namespaces, this member specifies the size of the corresponding Active Directory data 
     *        blob, in bytes. For stand-alone DFS namespaces, this member specifies the size of the metadata stored in the 
     *        registry, including the key names and value names as well as the specific data items associated with them.
     * 
     * This member is valid for DFS roots only.
     * @type {Integer}
     */
    MetadataSize {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Specifies the number of targets for the DFS root or link.
     * @type {Integer}
     */
    NumberOfStorages {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
