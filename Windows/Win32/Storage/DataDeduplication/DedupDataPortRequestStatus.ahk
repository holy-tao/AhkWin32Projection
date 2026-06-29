#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
export default struct DedupDataPortRequestStatus {
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
    static DedupDataPortRequestStatus_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static DedupDataPortRequestStatus_Queued => 1

    /**
     * @type {Integer (Int32)}
     */
    static DedupDataPortRequestStatus_Processing => 2

    /**
     * @type {Integer (Int32)}
     */
    static DedupDataPortRequestStatus_Partial => 3

    /**
     * @type {Integer (Int32)}
     */
    static DedupDataPortRequestStatus_Complete => 4

    /**
     * @type {Integer (Int32)}
     */
    static DedupDataPortRequestStatus_Failed => 5
}
