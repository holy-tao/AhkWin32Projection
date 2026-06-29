#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DFS_TARGET_PRIORITY.ahk" { DFS_TARGET_PRIORITY }
#Import ".\DFS_TARGET_PRIORITY_CLASS.ahk" { DFS_TARGET_PRIORITY_CLASS }

/**
 * Contains the priority of a DFS root target or link target.
 * @see https://learn.microsoft.com/windows/win32/api/lmdfs/ns-lmdfs-dfs_info_104
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 */
export default struct DFS_INFO_104 {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_target_priority">DFS_TARGET_PRIORITY</a> structure that contains the specific priority class and rank of a DFS target.
     */
    TargetPriority : DFS_TARGET_PRIORITY

}
