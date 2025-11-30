#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UNumberFormatStyle extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_PATTERN_DECIMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_DECIMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_CURRENCY => 2

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_PERCENT => 3

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_SCIENTIFIC => 4

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_SPELLOUT => 5

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_ORDINAL => 6

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_DURATION => 7

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_NUMBERING_SYSTEM => 8

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_PATTERN_RULEBASED => 9

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_CURRENCY_ISO => 10

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_CURRENCY_PLURAL => 11

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_CURRENCY_ACCOUNTING => 12

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_CASH_CURRENCY => 13

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_DECIMAL_COMPACT_SHORT => 14

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_DECIMAL_COMPACT_LONG => 15

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_CURRENCY_STANDARD => 16

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_IGNORE => 0
}
