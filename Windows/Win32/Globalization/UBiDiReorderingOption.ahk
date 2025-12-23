#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UBiDiReorderingOption extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UBIDI_OPTION_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static UBIDI_OPTION_INSERT_MARKS => 1

    /**
     * @type {Integer (Int32)}
     */
    static UBIDI_OPTION_REMOVE_CONTROLS => 2

    /**
     * @type {Integer (Int32)}
     */
    static UBIDI_OPTION_STREAMING => 4
}
