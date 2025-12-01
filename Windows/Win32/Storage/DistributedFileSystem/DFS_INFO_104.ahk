#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DFS_TARGET_PRIORITY.ahk

/**
 * Contains the priority of a DFS root target or link target.
 * @see https://learn.microsoft.com/windows/win32/api/lmdfs/ns-lmdfs-dfs_info_104
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @version v4.0.30319
 */
class DFS_INFO_104 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_target_priority">DFS_TARGET_PRIORITY</a> structure that contains the specific priority class and rank of a DFS target.
     * @type {DFS_TARGET_PRIORITY}
     */
    TargetPriority{
        get {
            if(!this.HasProp("__TargetPriority"))
                this.__TargetPriority := DFS_TARGET_PRIORITY(0, this)
            return this.__TargetPriority
        }
    }
}
