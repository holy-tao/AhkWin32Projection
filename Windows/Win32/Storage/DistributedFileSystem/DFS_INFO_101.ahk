#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the state of storage on a DFS root, link, root target, or link target.
 * @see https://learn.microsoft.com/windows/win32/api/lmdfs/ns-lmdfs-dfs_info_101
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 */
export default struct DFS_INFO_101 {
    #StructPack 4

    /**
     * Specifies a set of bit flags that describe the status of the host server. Following are valid values for this member. Note that the <b>DFS_STORAGE_STATE_OFFLINE</b> and <b>DFS_STORAGE_STATE_ONLINE</b> values are mutually exclusive. 
     * 
     * The storage states can only be set on DFS root targets or DFS link targets. The DFS volume states can only be set on a DFS namespace root or DFS link and not on individual targets.
     */
    State : UInt32

}
