#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the various fault states for a cluster shared volume (CSV).
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ne-clusapi-cluster_csv_volume_fault_state
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_CSV_VOLUME_FAULT_STATE extends Win32Enum{

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
