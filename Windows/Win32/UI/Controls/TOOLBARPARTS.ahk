#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TOOLBARPARTS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TP_BUTTON => 1

    /**
     * @type {Integer (Int32)}
     */
    static TP_DROPDOWNBUTTON => 2

    /**
     * @type {Integer (Int32)}
     */
    static TP_SPLITBUTTON => 3

    /**
     * @type {Integer (Int32)}
     */
    static TP_SPLITBUTTONDROPDOWN => 4

    /**
     * @type {Integer (Int32)}
     */
    static TP_SEPARATOR => 5

    /**
     * @type {Integer (Int32)}
     */
    static TP_SEPARATORVERT => 6

    /**
     * @type {Integer (Int32)}
     */
    static TP_DROPDOWNBUTTONGLYPH => 7
}
