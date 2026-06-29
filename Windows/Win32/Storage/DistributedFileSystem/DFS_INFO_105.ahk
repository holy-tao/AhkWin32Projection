#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information about a DFS root or link, including comment, state, time-out, and DFS behaviors specified by property flags.
 * @see https://learn.microsoft.com/windows/win32/api/lmdfs/ns-lmdfs-dfs_info_105
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 */
export default struct DFS_INFO_105 {
    #StructPack 8

    /**
     * Pointer to a null-terminated Unicode string that contains a comment associated with the DFS root or 
     *       link.
     */
    Comment : PWSTR

    /**
     * Specifies a set of bit flags that describe the state of the DFS root or link; the state of the DFS 
     *       namespace root cannot be changed. One <b>DFS_VOLUME_STATE</b> flag is set, and one 
     *       <b>DFS_VOLUME_FLAVOR</b> flag is set. For an example that describes the interpretation of 
     *       these flags, see the Remarks section of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_info_2">DFS_INFO_2</a>.
     */
    State : UInt32

    /**
     * Specifies the time-out, in seconds, of the DFS root or link.
     */
    Timeout : UInt32

    /**
     * Specifies a mask value that indicates which flags are valid for evaluation in the 
     *       <b>PropertyFlags</b> field.
     */
    PropertyFlagMask : UInt32

    /**
     * Bitfield, with each bit responsible for a specific property applicable to the whole DFS namespace, the DFS 
     *       root, or an individual DFS link, depending on the actual property.  Any combination of bits is allowed unless 
     *       indicated otherwise.
     */
    PropertyFlags : UInt32

}
