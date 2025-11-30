#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TRAILINGGRIDCELLSTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MCTGC_HOT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MCTGC_HASSTATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MCTGC_HASSTATEHOT => 3

    /**
     * @type {Integer (Int32)}
     */
    static MCTGC_TODAY => 4

    /**
     * @type {Integer (Int32)}
     */
    static MCTGC_TODAYSELECTED => 5

    /**
     * @type {Integer (Int32)}
     */
    static MCTGC_SELECTED => 6

    /**
     * @type {Integer (Int32)}
     */
    static MCTGC_SELECTEDHOT => 7
}
