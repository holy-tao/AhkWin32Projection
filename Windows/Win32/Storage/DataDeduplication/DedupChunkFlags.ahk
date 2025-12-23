#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class DedupChunkFlags extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DedupChunkFlags_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static DedupChunkFlags_Compressed => 1
}
