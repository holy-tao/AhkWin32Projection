#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UHangulSyllableType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static U_HST_NOT_APPLICABLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static U_HST_LEADING_JAMO => 1

    /**
     * @type {Integer (Int32)}
     */
    static U_HST_VOWEL_JAMO => 2

    /**
     * @type {Integer (Int32)}
     */
    static U_HST_TRAILING_JAMO => 3

    /**
     * @type {Integer (Int32)}
     */
    static U_HST_LV_SYLLABLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static U_HST_LVT_SYLLABLE => 5
}
