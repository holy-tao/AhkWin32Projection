#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
class DedupHashingAlgorithm extends Win32Enum {

    /**
     * Native name: DedupHashingAlgorithm_Unknonwn
     * @type {Integer (Int32)}
     */
    static Unknonwn => 0

    /**
     * Native name: DedupHashingAlgorithm_V1
     * @type {Integer (Int32)}
     */
    static V1 => 1
}
