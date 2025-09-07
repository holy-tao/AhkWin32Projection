#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the status of a Scale-Out File Server clone.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_dnn_sodafs_clone_status
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_DNN_SODAFS_CLONE_STATUS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The node ID of the clone.
     * @type {Integer}
     */
    NodeId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_resource_state">CLUSTER_RESOURCE_STATE</a> enumeration value that specifies the status of the clone.
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
