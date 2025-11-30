#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class DedupDataPortManagerOption extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DedupDataPortManagerOption_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static DedupDataPortManagerOption_AutoStart => 1

    /**
     * @type {Integer (Int32)}
     */
    static DedupDataPortManagerOption_SkipReconciliation => 2
}
