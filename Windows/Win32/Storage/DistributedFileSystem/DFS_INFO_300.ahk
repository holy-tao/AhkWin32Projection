#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the name and type (domain-based or stand-alone) of a DFS namespace.
 * @remarks
 * 
  * The DFS functions use the 
  * <b>DFS_INFO_300</b> structure to enumerate DFS namespaces hosted on a machine.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//lmdfs/ns-lmdfs-dfs_info_300
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @version v4.0.30319
 */
class DFS_INFO_300 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the name of a DFS namespace. This member can have one of the following two formats.
     * 
     * The first format is:
     * 
     * &#92;<i>ServerName</i>&#92;<i>DfsName</i>
     * 
     * where <i>ServerName</i> is the name of the root target server that hosts the stand-alone DFS namespace and <i>DfsName</i> is the name of the DFS namespace.
     * 
     * The second format is:
     * 
     * &#92;<i>DomainName</i>&#92;<i>DomDfsName</i>
     * 
     * where <i>DomainName</i> is the name of the domain that hosts the domain-based DFS namespace and <i>DomDfsname</i> is the name of the DFS namespace.
     * @type {PWSTR}
     */
    DfsName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
