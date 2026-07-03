#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSTER_CSV_VOLUME_FAULT_STATE.ahk" { CLUSTER_CSV_VOLUME_FAULT_STATE }
#Import ".\CLUSTER_SHARED_VOLUME_BACKUP_STATE.ahk" { CLUSTER_SHARED_VOLUME_BACKUP_STATE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Represents information about a cluster shared volume (CSV).
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_csv_volume_info
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_CSV_VOLUME_INFO {
    #StructPack 8

    /**
     * The physical offset, in bytes, of the data on the CSV.
     */
    VolumeOffset : Int64

    /**
     * The partition number of the CSV.
     */
    PartitionNumber : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ne-clusapi-cluster_csv_volume_fault_state">CLUSTER_CSV_VOLUME_FAULT_STATE</a> enumeration value that specifies the fault state of the CSV.
     */
    FaultState : CLUSTER_CSV_VOLUME_FAULT_STATE

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ne-clusapi-cluster_shared_volume_backup_state">CLUSTER_SHARED_VOLUME_BACKUP_STATE</a> enumeration value that specifies the state of the CSV backup.
     */
    BackupState : CLUSTER_SHARED_VOLUME_BACKUP_STATE

    /**
     * The friendly name of the CSV.
     */
    szVolumeFriendlyName : WCHAR[260]

    /**
     * The volume <b>GUID</b> path of the CSV.
     */
    szVolumeName : WCHAR[50]

}
