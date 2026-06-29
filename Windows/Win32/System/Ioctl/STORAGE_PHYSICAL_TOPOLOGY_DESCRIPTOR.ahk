#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_PHYSICAL_NODE_DATA.ahk" { STORAGE_PHYSICAL_NODE_DATA }

/**
 * The STORAGE_PHYSICAL_TOPOLOGY_DESCRIPTOR structure is one of the query result structures returned from an IOCTL_STORAGE_QUERY_PROPERTY request.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_physical_topology_descriptor
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_PHYSICAL_TOPOLOGY_DESCRIPTOR {
    #StructPack 4

    /**
     * Contains the size of this structure, in bytes. Set to <c>sizeof(STORAGE_PHYSICAL_TOPOLOGY_DESCRIPTOR)</c>.
     */
    Version : UInt32

    /**
     * Specifies the total size of the data, in bytes. Should be &gt;= <c>sizeof(STORAGE_PHYSICAL_TOPOLOGY_DESCRIPTOR)</c>.
     */
    Size : UInt32

    /**
     * Specifies the number of nodes.
     */
    NodeCount : UInt32

    /**
     * Reserved.
     */
    Reserved : UInt32

    /**
     * A node as specified by a <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_physical_node_data">STORAGE_PHYSICAL_NODE_DATA</a> structure.
     */
    Node : STORAGE_PHYSICAL_NODE_DATA[1]

}
