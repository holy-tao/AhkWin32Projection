#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_PHYSICAL_NODE_DATA.ahk

/**
 * The STORAGE_PHYSICAL_TOPOLOGY_DESCRIPTOR structure is one of the query result structures returned from an IOCTL_STORAGE_QUERY_PROPERTY request.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-storage_physical_topology_descriptor
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_PHYSICAL_TOPOLOGY_DESCRIPTOR extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Contains the size of this structure, in bytes. Set to <c>sizeof(STORAGE_PHYSICAL_TOPOLOGY_DESCRIPTOR)</c>.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the total size of the data, in bytes. Should be &gt;= <c>sizeof(STORAGE_PHYSICAL_TOPOLOGY_DESCRIPTOR)</c>.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the number of nodes.
     * @type {Integer}
     */
    NodeCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A node as specified by a <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_physical_node_data">STORAGE_PHYSICAL_NODE_DATA</a> structure.
     * @type {Array<STORAGE_PHYSICAL_NODE_DATA>}
     */
    Node{
        get {
            if(!this.HasProp("__NodeProxyArray"))
                this.__NodeProxyArray := Win32FixedArray(this.ptr + 16, 1, STORAGE_PHYSICAL_NODE_DATA, "")
            return this.__NodeProxyArray
        }
    }
}
