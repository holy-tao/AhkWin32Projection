#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the various fault states for a cluster shared volume (CSV).
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ne-clusapi-cluster_csv_volume_fault_state
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_CSV_VOLUME_FAULT_STATE extends Win32Enum {

    /**
     * The CSV has no faults.
     * Native name: VolumeStateNoFaults
     * @type {Integer (Int32)}
     */
    static NoFaults => 0

    /**
     * Direct I/O is disabled for the CSV.
     * Native name: VolumeStateNoDirectIO
     * @type {Integer (Int32)}
     */
    static NoDirectIO => 1

    /**
     * The CSV can not be accessed.
     * Native name: VolumeStateNoAccess
     * @type {Integer (Int32)}
     */
    static NoAccess => 2

    /**
     * The CSV is in maintenance mode.
     * Native name: VolumeStateInMaintenance
     * @type {Integer (Int32)}
     */
    static InMaintenance => 4

    /**
     * The CSV is dismounted.
     * Native name: VolumeStateDismounted
     * @type {Integer (Int32)}
     */
    static Dismounted => 8
}
