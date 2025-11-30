#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class DedupHashingAlgorithm extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DedupHashingAlgorithm_Unknonwn => 0

    /**
     * @type {Integer (Int32)}
     */
    static DedupHashingAlgorithm_V1 => 1
}
