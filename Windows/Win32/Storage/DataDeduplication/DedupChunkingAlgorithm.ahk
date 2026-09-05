#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
class DedupChunkingAlgorithm extends Win32Enum {

    /**
     * Native name: DedupChunkingAlgorithm_Unknonwn
     * @type {Integer (Int32)}
     */
    static Unknonwn => 0

    /**
     * Native name: DedupChunkingAlgorithm_V1
     * @type {Integer (Int32)}
     */
    static V1 => 1
}
