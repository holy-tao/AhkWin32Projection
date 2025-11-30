#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the CSV backup state.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ne-clusapi-cluster_shared_volume_backup_state
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_SHARED_VOLUME_BACKUP_STATE extends Win32Enum{

    /**
     * There is no backup in progress for this CSV.
     * @type {Integer (Int32)}
     */
    static VolumeBackupNone => 0

    /**
     * There is a backup in progress for this CSV.
     * @type {Integer (Int32)}
     */
    static VolumeBackupInProgress => 1
}
