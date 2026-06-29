#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a node identifier.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-clfs_node_id
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CLFS_NODE_ID {
    #StructPack 4

    /**
     * The CLFS node type.
     */
    cType : UInt32

    /**
     * The size of the CLFS node, in bytes.
     */
    cbNode : UInt32

}
