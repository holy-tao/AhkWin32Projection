#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class UPHORZSTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static UPHZS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static UPHZS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static UPHZS_PRESSED => 3

    /**
     * @type {Integer (Int32)}
     */
    static UPHZS_DISABLED => 4
}
