#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSTER_SHARED_VOLUME_BACKUP_STATE.ahk" { CLUSTER_SHARED_VOLUME_BACKUP_STATE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Describes the backup mode for CSV.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_shared_volume_backup_mode
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_SHARED_VOLUME_BACKUP_MODE {
    #StructPack 4

    /**
     * Value from 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ne-clusapi-cluster_shared_volume_backup_state">CLUSTER_SHARED_VOLUME_BACKUP_STATE</a> 
     *        enumeration.
     */
    BackupState : CLUSTER_SHARED_VOLUME_BACKUP_STATE

    /**
     * If the <b>BackupState</b> member is set to <b>VolumeBackupNone</b> 
     *       then this member must be set to 0. Otherwise this member must be set to a nonzero value.
     */
    DelayTimerInSecs : UInt32

    /**
     * Null-terminated Unicode string containing the name of the shared volume. The name provided can 
     *       be either the cluster-assigned friendly name or the volume GUID path of the form 
     *       "\\?\Volume{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}\".
     */
    VolumeName : WCHAR[260]

}
