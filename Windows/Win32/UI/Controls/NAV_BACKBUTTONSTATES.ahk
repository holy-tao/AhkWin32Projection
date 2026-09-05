#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class NAV_BACKBUTTONSTATES extends Win32Enum {

    /**
     * Native name: NAV_BB_NORMAL
     * @type {Integer (Int32)}
     */
    static BB_NORMAL => 1

    /**
     * Native name: NAV_BB_HOT
     * @type {Integer (Int32)}
     */
    static BB_HOT => 2

    /**
     * Native name: NAV_BB_PRESSED
     * @type {Integer (Int32)}
     */
    static BB_PRESSED => 3

    /**
     * Native name: NAV_BB_DISABLED
     * @type {Integer (Int32)}
     */
    static BB_DISABLED => 4
}
