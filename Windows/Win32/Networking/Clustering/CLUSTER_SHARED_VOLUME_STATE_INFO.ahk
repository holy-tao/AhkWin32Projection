#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSTER_SHARED_VOLUME_STATE.ahk" { CLUSTER_SHARED_VOLUME_STATE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Represents information about the state of a Cluster Shared Volume (CSV). (CLUSTER_SHARED_VOLUME_STATE_INFO)
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-cluster_shared_volume_state_info
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_SHARED_VOLUME_STATE_INFO {
    #StructPack 4

    /**
     * A Unicode string that contains the volume name of the CSV. The string ends in a terminating null character. The name that is provided can be either the cluster-assigned friendly name or the volume GUID path of the form "\\?\Volume{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}\".
     */
    szVolumeName : WCHAR[260]

    /**
     * The node name  of the node that hosts the CSV.
     */
    szNodeName : WCHAR[260]

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ne-clusapi-cluster_shared_volume_state">CLUSTER_SHARED_VOLUME_STATE</a> enumeration value that specifies the state of the CSV.
     */
    VolumeState : CLUSTER_SHARED_VOLUME_STATE

}
