#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the backup mode for CSV.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-clus_shared_volume_backup_mode
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_SHARED_VOLUME_BACKUP_MODE extends Win32Struct
{
    static sizeof => 528

    static packingSize => 4

    /**
     * Value from 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ne-clusapi-cluster_shared_volume_backup_state">CLUSTER_SHARED_VOLUME_BACKUP_STATE</a> 
     *        enumeration.
     * @type {Integer}
     */
    BackupState {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * If the <b>BackupState</b> member is set to <b>VolumeBackupNone</b> 
     *       then this member must be set to 0. Otherwise this member must be set to a nonzero value.
     * @type {Integer}
     */
    DelayTimerInSecs {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Null-terminated Unicode string containing the name of the shared volume. The name provided can 
     *       be either the cluster-assigned friendly name or the volume GUID path of the form 
     *       "\\?\Volume{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}\".
     * @type {String}
     */
    VolumeName {
        get => StrGet(this.ptr + 8, 259, "UTF-16")
        set => StrPut(value, this.ptr + 8, 259, "UTF-16")
    }
}
