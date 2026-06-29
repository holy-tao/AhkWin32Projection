#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
export default struct DedupDataPortVolumeStatus {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
