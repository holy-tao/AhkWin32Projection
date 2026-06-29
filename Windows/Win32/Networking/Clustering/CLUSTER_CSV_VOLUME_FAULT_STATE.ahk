#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the various fault states for a cluster shared volume (CSV).
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ne-clusapi-cluster_csv_volume_fault_state
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_CSV_VOLUME_FAULT_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The CSV has no faults.
     * @type {Integer (Int32)}
     */
    static VolumeStateNoFaults => 0

    /**
     * Direct I/O is disabled for the CSV.
     * @type {Integer (Int32)}
     */
    static VolumeStateNoDirectIO => 1

    /**
     * The CSV can not be accessed.
     * @type {Integer (Int32)}
     */
    static VolumeStateNoAccess => 2

    /**
     * The CSV is in maintenance mode.
     * @type {Integer (Int32)}
     */
    static VolumeStateInMaintenance => 4

    /**
     * The CSV is dismounted.
     * @type {Integer (Int32)}
     */
    static VolumeStateDismounted => 8
}
