#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class DedupDataPortVolumeStatus{

    /**
     * @type {Integer (Int32)}
     */
    static DedupDataPortVolumeStatus_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static DedupDataPortVolumeStatus_NotEnabled => 1

    /**
     * @type {Integer (Int32)}
     */
    static DedupDataPortVolumeStatus_NotAvailable => 2

    /**
     * @type {Integer (Int32)}
     */
    static DedupDataPortVolumeStatus_Initializing => 3

    /**
     * @type {Integer (Int32)}
     */
    static DedupDataPortVolumeStatus_Ready => 4

    /**
     * @type {Integer (Int32)}
     */
    static DedupDataPortVolumeStatus_Maintenance => 5

    /**
     * @type {Integer (Int32)}
     */
    static DedupDataPortVolumeStatus_Shutdown => 6
}
