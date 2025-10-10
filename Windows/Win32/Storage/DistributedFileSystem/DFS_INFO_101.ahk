#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the state of storage on a DFS root, link, root target, or link target.
 * @see https://docs.microsoft.com/windows/win32/api//lmdfs/ns-lmdfs-dfs_info_101
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @version v4.0.30319
 */
class DFS_INFO_101 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies a set of bit flags that describe the status of the host server. Following are valid values for this member. Note that the <b>DFS_STORAGE_STATE_OFFLINE</b> and <b>DFS_STORAGE_STATE_ONLINE</b> values are mutually exclusive. 
     * 
     * The storage states can only be set on DFS root targets or DFS link targets. The DFS volume states can only be set on a DFS namespace root or DFS link and not on individual targets.
     * @type {Integer}
     */
    State {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
