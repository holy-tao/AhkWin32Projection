#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class DedupChunkingAlgorithm extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DedupChunkingAlgorithm_Unknonwn => 0

    /**
     * @type {Integer (Int32)}
     */
    static DedupChunkingAlgorithm_V1 => 1
}
