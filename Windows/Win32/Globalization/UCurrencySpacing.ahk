#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UCurrencySpacing extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_CURRENCY_MATCH => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_CURRENCY_SURROUNDING_MATCH => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_CURRENCY_INSERT => 2

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_CURRENCY_SPACING_COUNT => 3
}
