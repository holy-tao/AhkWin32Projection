#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class StringDigitSubstitute extends Win32Enum {

    /**
     * Native name: StringDigitSubstituteUser
     * @type {Integer (Int32)}
     */
    static User => 0

    /**
     * Native name: StringDigitSubstituteNone
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * Native name: StringDigitSubstituteNational
     * @type {Integer (Int32)}
     */
    static National => 2

    /**
     * Native name: StringDigitSubstituteTraditional
     * @type {Integer (Int32)}
     */
    static Traditional => 3
}
