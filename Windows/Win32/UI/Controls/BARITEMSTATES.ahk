#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class BARITEMSTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MBI_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static MBI_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static MBI_PUSHED => 3

    /**
     * @type {Integer (Int32)}
     */
    static MBI_DISABLED => 4

    /**
     * @type {Integer (Int32)}
     */
    static MBI_DISABLEDHOT => 5

    /**
     * @type {Integer (Int32)}
     */
    static MBI_DISABLEDPUSHED => 6
}
