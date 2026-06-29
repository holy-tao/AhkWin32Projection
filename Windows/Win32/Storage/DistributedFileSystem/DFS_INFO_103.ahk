#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains properties that set specific behaviors for a DFS root or link.
 * @see https://learn.microsoft.com/windows/win32/api/lmdfs/ns-lmdfs-dfs_info_103
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 */
export default struct DFS_INFO_103 {
    #StructPack 4

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
