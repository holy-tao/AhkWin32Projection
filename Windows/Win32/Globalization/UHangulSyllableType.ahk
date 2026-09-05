#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UHangulSyllableType extends Win32Enum {

    /**
     * Native name: U_HST_NOT_APPLICABLE
     * @type {Integer (Int32)}
     */
    static HST_NOT_APPLICABLE => 0

    /**
     * Native name: U_HST_LEADING_JAMO
     * @type {Integer (Int32)}
     */
    static HST_LEADING_JAMO => 1

    /**
     * Native name: U_HST_VOWEL_JAMO
     * @type {Integer (Int32)}
     */
    static HST_VOWEL_JAMO => 2

    /**
     * Native name: U_HST_TRAILING_JAMO
     * @type {Integer (Int32)}
     */
    static HST_TRAILING_JAMO => 3

    /**
     * Native name: U_HST_LV_SYLLABLE
     * @type {Integer (Int32)}
     */
    static HST_LV_SYLLABLE => 4

    /**
     * Native name: U_HST_LVT_SYLLABLE
     * @type {Integer (Int32)}
     */
    static HST_LVT_SYLLABLE => 5
}
