#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains properties that set specific behaviors for a DFS root or link.
 * @see https://docs.microsoft.com/windows/win32/api//lmdfs/ns-lmdfs-dfs_info_103
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @version v4.0.30319
 */
class DFS_INFO_103 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies a mask value that indicates which flags are valid for evaluation in the 
     *       <b>PropertyFlags</b> field.
     * @type {Integer}
     */
    PropertyFlagMask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Bitfield, with each bit responsible for a specific property applicable to the whole DFS namespace, the DFS 
     *       root, or an individual DFS link, depending on the actual property.  Any combination of bits is allowed unless 
     *       indicated otherwise.
     * @type {Integer}
     */
    PropertyFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
