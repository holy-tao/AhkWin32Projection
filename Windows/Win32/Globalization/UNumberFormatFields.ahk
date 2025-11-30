#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UNumberFormatFields extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_INTEGER_FIELD => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_FRACTION_FIELD => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_DECIMAL_SEPARATOR_FIELD => 2

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_EXPONENT_SYMBOL_FIELD => 3

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_EXPONENT_SIGN_FIELD => 4

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_EXPONENT_FIELD => 5

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_GROUPING_SEPARATOR_FIELD => 6

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_CURRENCY_FIELD => 7

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_PERCENT_FIELD => 8

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_PERMILL_FIELD => 9

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_SIGN_FIELD => 10

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_MEASURE_UNIT_FIELD => 11

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_COMPACT_FIELD => 12
}
