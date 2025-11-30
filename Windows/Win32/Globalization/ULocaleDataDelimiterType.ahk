#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class ULocaleDataDelimiterType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ULOCDATA_QUOTATION_START => 0

    /**
     * @type {Integer (Int32)}
     */
    static ULOCDATA_QUOTATION_END => 1

    /**
     * @type {Integer (Int32)}
     */
    static ULOCDATA_ALT_QUOTATION_START => 2

    /**
     * @type {Integer (Int32)}
     */
    static ULOCDATA_ALT_QUOTATION_END => 3
}
