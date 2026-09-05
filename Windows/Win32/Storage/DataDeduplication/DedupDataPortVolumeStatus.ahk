#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
class DedupDataPortVolumeStatus extends Win32Enum {

    /**
     * Native name: DedupDataPortVolumeStatus_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: DedupDataPortVolumeStatus_NotEnabled
     * @type {Integer (Int32)}
     */
    static NotEnabled => 1

    /**
     * Native name: DedupDataPortVolumeStatus_NotAvailable
     * @type {Integer (Int32)}
     */
    static NotAvailable => 2

    /**
     * Native name: DedupDataPortVolumeStatus_Initializing
     * @type {Integer (Int32)}
     */
    static Initializing => 3

    /**
     * Native name: DedupDataPortVolumeStatus_Ready
     * @type {Integer (Int32)}
     */
    static Ready => 4

    /**
     * Native name: DedupDataPortVolumeStatus_Maintenance
     * @type {Integer (Int32)}
     */
    static Maintenance => 5

    /**
     * Native name: DedupDataPortVolumeStatus_Shutdown
     * @type {Integer (Int32)}
     */
    static Shutdown => 6
}
