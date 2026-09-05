#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
class DedupDataPortManagerOption extends Win32Enum {

    /**
     * Native name: DedupDataPortManagerOption_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: DedupDataPortManagerOption_AutoStart
     * @type {Integer (Int32)}
     */
    static AutoStart => 1

    /**
     * Native name: DedupDataPortManagerOption_SkipReconciliation
     * @type {Integer (Int32)}
     */
    static SkipReconciliation => 2
}
