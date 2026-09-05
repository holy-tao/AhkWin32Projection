#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
class DedupCompressionAlgorithm extends Win32Enum {

    /**
     * Native name: DedupCompressionAlgorithm_Unknonwn
     * @type {Integer (Int32)}
     */
    static Unknonwn => 0

    /**
     * Native name: DedupCompressionAlgorithm_Xpress
     * @type {Integer (Int32)}
     */
    static Xpress => 1
}
