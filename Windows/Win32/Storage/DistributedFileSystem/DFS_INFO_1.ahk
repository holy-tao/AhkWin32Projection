#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the name of a Distributed File System (DFS) root or link.
 * @remarks
 * 
 * The DFS functions use the 
 * <b>DFS_INFO_1</b> structure to retrieve information about a DFS root or link.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//lmdfs/ns-lmdfs-dfs_info_1
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @version v4.0.30319
 */
class DFS_INFO_1 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a null-terminated Unicode string that specifies the Universal Naming Convention (UNC) path of a DFS root or link.
     * 
     * For a link, the string can be in one of two forms. The first form is as follows:
     * 
     * &#92;&#92;<i>ServerName</i>&#92;<i>DfsName</i>&#92;<i>link_path</i>
     * 
     * where <i>ServerName</i> is the name of the root target server that hosts the stand-alone DFS namespace; <i>DfsName</i> is the name of the DFS namespace; and <i>link_path</i> is a DFS link.
     * 
     * The second form is as follows:
     * 
     * &#92;&#92;<i>DomainName</i>&#92;<i>DomDfsname</i>&#92;<i>link_path</i>
     * 
     * where <i>DomainName</i> is the name of the domain that hosts the domain-based DFS namespace; <i>DomDfsname</i> is the name of the DFS namespace; and <i>link_path</i> is a DFS link.
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
}
