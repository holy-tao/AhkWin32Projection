#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
class DedupChunkFlags extends Win32Enum {

    /**
     * Native name: DedupChunkFlags_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: DedupChunkFlags_Compressed
     * @type {Integer (Int32)}
     */
    static Compressed => 1
}
