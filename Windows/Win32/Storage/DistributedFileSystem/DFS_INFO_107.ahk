#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Security\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }

/**
 * Contains information about a DFS root or link, including the comment, state, time-out, property flags, and link reparse point security descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/lmdfs/ns-lmdfs-dfs_info_107
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 */
export default struct DFS_INFO_107 {
    #StructPack 8

    /**
     * Pointer to a null-terminated Unicode string that contains a comment associated with the DFS root or 
     *       link.
     */
    Comment : PWSTR

    /**
     * Specifies a set of bit flags that describe the DFS root or link. One 
     *       <b>DFS_VOLUME_STATE</b> flag is set, and one <b>DFS_VOLUME_FLAVOR</b> flag 
     *       is set. The <b>DFS_VOLUME_FLAVORS</b> bitmask (0x00000300) must be used to extract the DFS 
     *       namespace flavor, and the <b>DFS_VOLUME_STATES</b> bitmask (0x0000000F) must be used to 
     *       extract the DFS root or link state from this member. For an example that describes the interpretation of the 
     *       flags, see the Remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_info_2">DFS_INFO_2</a>.
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

    /**
     * This member is reserved for system use.
     */
    SdLengthReserved : UInt32

    /**
     * Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> 
     *       structure that specifies a self-relative security descriptor to be associated with the DFS link's reparse point. 
     *       This field is valid for DFS links only.
     */
    pSecurityDescriptor : PSECURITY_DESCRIPTOR

}
