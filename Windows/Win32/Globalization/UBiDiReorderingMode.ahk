#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UBiDiReorderingMode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UBIDI_REORDER_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static UBIDI_REORDER_NUMBERS_SPECIAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static UBIDI_REORDER_GROUP_NUMBERS_WITH_R => 2

    /**
     * @type {Integer (Int32)}
     */
    static UBIDI_REORDER_RUNS_ONLY => 3

    /**
     * @type {Integer (Int32)}
     */
    static UBIDI_REORDER_INVERSE_NUMBERS_AS_L => 4

    /**
     * @type {Integer (Int32)}
     */
    static UBIDI_REORDER_INVERSE_LIKE_DIRECT => 5

    /**
     * @type {Integer (Int32)}
     */
    static UBIDI_REORDER_INVERSE_FOR_NUMBERS_SPECIAL => 6
}
