#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a node identifier.
 * @see https://docs.microsoft.com/windows/win32/api//clfs/ns-clfs-clfs_node_id
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLFS_NODE_ID extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The CLFS node type.
     * @type {Integer}
     */
    cType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of the CLFS node, in bytes.
     * @type {Integer}
     */
    cbNode {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
