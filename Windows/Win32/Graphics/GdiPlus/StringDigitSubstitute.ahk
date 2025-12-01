#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class StringDigitSubstitute extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static StringDigitSubstituteUser => 0

    /**
     * @type {Integer (Int32)}
     */
    static StringDigitSubstituteNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static StringDigitSubstituteNational => 2

    /**
     * @type {Integer (Int32)}
     */
    static StringDigitSubstituteTraditional => 3
}
