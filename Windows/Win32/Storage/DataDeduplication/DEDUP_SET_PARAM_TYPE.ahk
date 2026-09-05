#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
class DEDUP_SET_PARAM_TYPE extends Win32Enum {

    /**
     * Native name: DEDUP_PT_MinChunkSizeBytes
     * @type {Integer (Int32)}
     */
    static PT_MinChunkSizeBytes => 1

    /**
     * Native name: DEDUP_PT_MaxChunkSizeBytes
     * @type {Integer (Int32)}
     */
    static PT_MaxChunkSizeBytes => 2

    /**
     * Native name: DEDUP_PT_AvgChunkSizeBytes
     * @type {Integer (Int32)}
     */
    static PT_AvgChunkSizeBytes => 3

    /**
     * Native name: DEDUP_PT_InvariantChunking
     * @type {Integer (Int32)}
     */
    static PT_InvariantChunking => 4

    /**
     * Native name: DEDUP_PT_DisableStrongHashComputation
     * @type {Integer (Int32)}
     */
    static PT_DisableStrongHashComputation => 5
}
