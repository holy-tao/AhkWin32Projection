#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a comment associated with a Distributed File System (DFS) root or link.
 * @remarks
 * The DFS functions use the <b>DFS_INFO_100</b> structure to 
  *     retrieve and set information about a DFS root or link.
 * @see https://learn.microsoft.com/windows/win32/api/lmdfs/ns-lmdfs-dfs_info_100
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @version v4.0.30319
 */
class DFS_INFO_100 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a null-terminated Unicode string that contains the comment associated with the specified DFS 
     *       root or link. The comment is associated with the DFS namespace root or link and not with a specific DFS root 
     *       target or link target.
     * @type {Pointer<Char>}
     */
    Comment {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
