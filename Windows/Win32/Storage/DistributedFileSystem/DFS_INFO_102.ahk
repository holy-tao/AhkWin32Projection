#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a time-out value to associate with a Distributed File System (DFS) root or a link in a named DFS root.
 * @see https://learn.microsoft.com/windows/win32/api/lmdfs/ns-lmdfs-dfs_info_102
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 */
export default struct DFS_INFO_102 {
    #StructPack 4

    /**
     * Specifies the time-out, in seconds, to apply to the specified DFS root or link.
     */
    Timeout : UInt32

}
