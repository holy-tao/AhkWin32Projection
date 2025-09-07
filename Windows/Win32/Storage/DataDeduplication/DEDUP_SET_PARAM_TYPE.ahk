#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class DEDUP_SET_PARAM_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static DEDUP_PT_MinChunkSizeBytes => 1

    /**
     * @type {Integer (Int32)}
     */
    static DEDUP_PT_MaxChunkSizeBytes => 2

    /**
     * @type {Integer (Int32)}
     */
    static DEDUP_PT_AvgChunkSizeBytes => 3

    /**
     * @type {Integer (Int32)}
     */
    static DEDUP_PT_InvariantChunking => 4

    /**
     * @type {Integer (Int32)}
     */
    static DEDUP_PT_DisableStrongHashComputation => 5
}
