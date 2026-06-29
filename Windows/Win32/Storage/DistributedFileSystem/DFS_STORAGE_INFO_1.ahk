#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DFS_TARGET_PRIORITY.ahk" { DFS_TARGET_PRIORITY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DFS_TARGET_PRIORITY_CLASS.ahk" { DFS_TARGET_PRIORITY_CLASS }

/**
 * Contains information about a DFS target, including the DFS target server name and share name as well as the target's state and priority.
 * @remarks
 * This structure is used as the <b>Storage</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_info_6">DFS_INFO_6</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/lmdfs/ns-lmdfs-dfs_storage_info_1
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 */
export default struct DFS_STORAGE_INFO_1 {
    #StructPack 8

    State : UInt32

    /**
     * Pointer to a null-terminated Unicode string that specifies the DFS root target or link target server name.
     */
    ServerName : PWSTR

    /**
     * Pointer to a null-terminated Unicode string that specifies the DFS root target or link target share name.
     */
    ShareName : PWSTR

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_target_priority">DFS_TARGET_PRIORITY</a> structure that contains a DFS target's priority class and rank.
     */
    TargetPriority : DFS_TARGET_PRIORITY

}
