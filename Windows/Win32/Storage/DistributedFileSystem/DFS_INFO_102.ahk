#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a time-out value to associate with a Distributed File System (DFS) root or a link in a named DFS root.
 * @see https://learn.microsoft.com/windows/win32/api/lmdfs/ns-lmdfs-dfs_info_102
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @version v4.0.30319
 */
class DFS_INFO_102 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the time-out, in seconds, to apply to the specified DFS root or link.
     * @type {Integer}
     */
    Timeout {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
