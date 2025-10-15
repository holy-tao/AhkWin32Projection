#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information about a Distributed File System (DFS) root or link. This structure contains the name, status, number of DFS targets, and information about each target of the root or link.
 * @remarks
 * 
  * A <b>DFS_INFO_3</b> structure contains one or more 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_storage_info">DFS_STORAGE_INFO</a> structures, one for each DFS 
  *     target.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//lmdfs/ns-lmdfs-dfs_info_3
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @version v4.0.30319
 */
class DFS_INFO_3 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to a null-terminated Unicode string that specifies the Universal Naming Convention (UNC) path of a 
     *        DFS root or link.
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
    EntryPath{
        get {
            if(!this.HasProp("__EntryPath"))
                this.__EntryPath := PWSTR(this.ptr + 0)
            return this.__EntryPath
        }
    }

    /**
     * Pointer to a null-terminated Unicode string that contains a comment associated with the DFS root or 
     *       link.
     * @type {PWSTR}
     */
    Comment{
        get {
            if(!this.HasProp("__Comment"))
                this.__Comment := PWSTR(this.ptr + 8)
            return this.__Comment
        }
    }

    /**
     * Specifies a set of bit flags that describe the DFS root or link. One 
     *       <b>DFS_VOLUME_STATE</b> flag is set, and one <b>DFS_VOLUME_FLAVOR</b> flag 
     *       is set. The <b>DFS_VOLUME_FLAVORS</b> bitmask (0x00000300) must be used to extract the DFS 
     *       namespace flavor, and the <b>DFS_VOLUME_STATES</b> bitmask (0x0000000F) must be used to 
     *       extract the DFS root or link state from this member. For an example that describes the interpretation of the 
     *       flags, see the Remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_info_2">DFS_INFO_2</a>.
     * @type {Integer}
     */
    State {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the number of DFS targets.
     * @type {Integer}
     */
    NumberOfStorages {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_storage_info">DFS_STORAGE_INFO</a> 
     *       structures. The <b>NumberOfStorages</b> member specifies the number of structures in the 
     *       array.
     * @type {Pointer<DFS_STORAGE_INFO>}
     */
    Storage {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
