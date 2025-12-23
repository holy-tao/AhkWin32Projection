#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBTABLESTATISTICSTYPE26 extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBSTAT_HISTOGRAM => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBSTAT_COLUMN_CARDINALITY => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBSTAT_TUPLE_CARDINALITY => 4
}
