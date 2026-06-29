#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Input buffer used with the FSCTL_DFS_GET_PKT_ENTRY_STATE control code.
 * @see https://learn.microsoft.com/windows/win32/api/lmdfs/ns-lmdfs-dfs_get_pkt_entry_state_arg
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 */
export default struct DFS_GET_PKT_ENTRY_STATE_ARG {
    #StructPack 4

    /**
     * Length of the DFS Entry Path Unicode string in bytes stored in the <i>Buffer</i> 
     *       parameter.
     */
    DfsEntryPathLen : UInt16

    /**
     * Length of the Server Name Unicode string in bytes stored in the <i>Buffer</i> parameter 
     *       following the DFS Entry Path string.
     */
    ServerNameLen : UInt16

    /**
     * Length of the Share Name Unicode string in bytes stored in the <i>Buffer</i> parameter 
     *       following the Server Name string.
     */
    ShareNameLen : UInt16

    /**
     * Length of the Level string in bytes.
     */
    Level : UInt32

    /**
     * On input this contains the three Unicode strings in order. The Unicode strings are not 
     *       <b>NULL</b> terminated and there is no delimiter between the strings.
     */
    Buffer : WCHAR[1]

}
