#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the CSV backup state.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ne-clusapi-cluster_shared_volume_backup_state
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_SHARED_VOLUME_BACKUP_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
