#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TRAILINGGRIDCELLUPPERSTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MCTGCU_HOT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MCTGCU_HASSTATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MCTGCU_HASSTATEHOT => 3

    /**
     * @type {Integer (Int32)}
     */
    static MCTGCU_SELECTED => 4

    /**
     * @type {Integer (Int32)}
     */
    static MCTGCU_SELECTEDHOT => 5
}
