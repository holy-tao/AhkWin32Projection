#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DFS_STORAGE_INFO_1.ahk" { DFS_STORAGE_INFO_1 }

/**
 * Contains information about a Distributed File System (DFS) root or link. This structure contains the name, status, GUID, time-out, namespace/root/link properties, metadata size, number of targets, and information about each target of the root or link.
 * @remarks
 * For more information about how server target priority is determined, see 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dfs/dfs-server-target-prioritization">DFS Server Target Prioritization</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lmdfs/ns-lmdfs-dfs_info_6
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 */
export default struct DFS_INFO_6 {
    #StructPack 8

    /**
     * Pointer to a null-terminated Unicode string that specifies the Universal Naming Convention (UNC) path of a 
     *        DFS root or link.
     * 
     * For a link, the string can be in one of two forms. The first form is as follows:
     * 
     * &#92;&#92;<i>ServerName</i>&#92;<i>DfsName</i>&#92;<i>link_path</i>
     * 
     * where <i>ServerName</i> is the name of the root target server that hosts the stand-alone 
     *        DFS namespace; <i>DfsName</i> is the name of the DFS namespace; and 
     *        <i>link_path</i> is a DFS link.
     * 
     * The second form is as follows:
     * 
     * &#92;&#92;<i>DomainName</i>&#92;<i>DomDfsname</i>&#92;<i>link_path</i>
     * 
     * where <i>DomainName</i> is the name of the domain that hosts the domain-based DFS 
     *        namespace; <i>DomDfsname</i> is the name of the DFS namespace; and 
     *        <i>link_path</i> is a DFS link.
     * 
     * For a root, the string can be in one of two forms:
     * 
     * &#92;&#92;<i>ServerName</i>&#92;<i>DfsName</i>
     * 
     * or
     * 
     * &#92;&#92;<i>DomainName</i>&#92;<i>DomDfsname</i>
     * 
     * where the values of the names are the same as those described previously.
     */
    EntryPath : PWSTR

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
     * Specifies the <b>GUID</b> of the DFS root or link.
     */
    Guid : Guid

    /**
     * Specifies a set of flags describing specific properties of a DFS namespace, root, or link.
     */
    PropertyFlags : UInt32

    /**
     * For domain-based DFS namespaces, this member specifies the size of the corresponding Active Directory data 
     *        blob, in bytes. For stand-alone DFS namespaces, this field specifies the size of the metadata stored in the 
     *        registry, including the key names and value names as well as the specific data items associated with them.
     * 
     * This field is valid for DFS roots only.
     */
    MetadataSize : UInt32

    /**
     * Specifies the number of targets for the DFS root or link. These targets are contained in the 
     *       <b>Storage</b> member of this structure.
     */
    NumberOfStorages : UInt32

    /**
     * Specifies an array of <a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_storage_info_1">DFS_STORAGE_INFO_1</a> 
     *       structures that contain the DFS target information.
     */
    Storage : DFS_STORAGE_INFO_1.Ptr

}
