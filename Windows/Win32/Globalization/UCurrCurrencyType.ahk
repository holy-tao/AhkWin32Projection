#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UCurrCurrencyType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UCURR_ALL => 2147483647

    /**
     * @type {Integer (Int32)}
     */
    static UCURR_COMMON => 1

    /**
     * @type {Integer (Int32)}
     */
    static UCURR_UNCOMMON => 2

    /**
     * @type {Integer (Int32)}
     */
    static UCURR_DEPRECATED => 4

    /**
     * @type {Integer (Int32)}
     */
    static UCURR_NON_DEPRECATED => 8
}
