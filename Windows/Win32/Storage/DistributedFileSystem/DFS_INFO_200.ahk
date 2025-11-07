#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the name of a domain-based Distributed File System (DFS) namespace.
 * @remarks
 * 
 * The <b>DFS_INFO_200</b> structure is used to enumerate domain-based DFS namespaces in a domain.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//lmdfs/ns-lmdfs-dfs_info_200
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @version v4.0.30319
 */
class DFS_INFO_200 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a null-terminated Unicode string that contains the name of a domain-based DFS namespace.
     * @type {PWSTR}
     */
    FtDfsName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
