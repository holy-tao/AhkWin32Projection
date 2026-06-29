#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains the name of a domain-based Distributed File System (DFS) namespace.
 * @remarks
 * The <b>DFS_INFO_200</b> structure is used to enumerate domain-based DFS namespaces in a domain.
 * @see https://learn.microsoft.com/windows/win32/api/lmdfs/ns-lmdfs-dfs_info_200
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 */
export default struct DFS_INFO_200 {
    #StructPack 8

    /**
     * Pointer to a null-terminated Unicode string that contains the name of a domain-based DFS namespace.
     */
    FtDfsName : PWSTR

}
