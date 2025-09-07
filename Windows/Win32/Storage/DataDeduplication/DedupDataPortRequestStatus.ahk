#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class DedupDataPortRequestStatus{

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
