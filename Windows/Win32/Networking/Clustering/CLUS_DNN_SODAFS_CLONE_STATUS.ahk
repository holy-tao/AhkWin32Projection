#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSTER_RESOURCE_STATE.ahk" { CLUSTER_RESOURCE_STATE }

/**
 * Represents the status of a Scale-Out File Server clone.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_dnn_sodafs_clone_status
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_DNN_SODAFS_CLONE_STATUS {
    #StructPack 4

    /**
     * The node ID of the clone.
     */
    NodeId : UInt32

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_resource_state">CLUSTER_RESOURCE_STATE</a> enumeration value that specifies the status of the clone.
     */
    Status : CLUSTER_RESOURCE_STATE

}
