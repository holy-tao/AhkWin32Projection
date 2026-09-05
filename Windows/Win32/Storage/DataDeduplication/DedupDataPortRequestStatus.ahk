#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
class DedupDataPortRequestStatus extends Win32Enum {

    /**
     * Native name: DedupDataPortRequestStatus_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: DedupDataPortRequestStatus_Queued
     * @type {Integer (Int32)}
     */
    static Queued => 1

    /**
     * Native name: DedupDataPortRequestStatus_Processing
     * @type {Integer (Int32)}
     */
    static Processing => 2

    /**
     * Native name: DedupDataPortRequestStatus_Partial
     * @type {Integer (Int32)}
     */
    static Partial => 3

    /**
     * Native name: DedupDataPortRequestStatus_Complete
     * @type {Integer (Int32)}
     */
    static Complete => 4

    /**
     * Native name: DedupDataPortRequestStatus_Failed
     * @type {Integer (Int32)}
     */
    static Failed => 5
}
