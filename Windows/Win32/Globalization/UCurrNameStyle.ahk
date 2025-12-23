#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UCurrNameStyle extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UCURR_SYMBOL_NAME => 0

    /**
     * @type {Integer (Int32)}
     */
    static UCURR_LONG_NAME => 1

    /**
     * @type {Integer (Int32)}
     */
    static UCURR_NARROW_SYMBOL_NAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static UCURR_VARIANT_SYMBOL_NAME => 3
}
