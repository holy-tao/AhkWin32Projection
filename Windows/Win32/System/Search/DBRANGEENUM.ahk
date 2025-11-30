#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBRANGEENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBRANGE_INCLUSIVESTART => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBRANGE_INCLUSIVEEND => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBRANGE_EXCLUSIVESTART => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBRANGE_EXCLUSIVEEND => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBRANGE_EXCLUDENULLS => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBRANGE_PREFIX => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBRANGE_MATCH => 16
}
