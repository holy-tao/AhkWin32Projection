#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UNumberGroupingStrategy extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_GROUPING_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_GROUPING_MIN2 => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_GROUPING_AUTO => 2

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_GROUPING_ON_ALIGNED => 3

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_GROUPING_THOUSANDS => 4
}
