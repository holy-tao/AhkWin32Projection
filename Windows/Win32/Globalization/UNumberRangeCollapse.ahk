#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UNumberRangeCollapse extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_RANGE_COLLAPSE_AUTO => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_RANGE_COLLAPSE_NONE => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_RANGE_COLLAPSE_UNIT => 2

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_RANGE_COLLAPSE_ALL => 3
}
