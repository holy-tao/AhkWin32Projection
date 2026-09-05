#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class NAV_MENUBUTTONSTATES extends Win32Enum {

    /**
     * Native name: NAV_MB_NORMAL
     * @type {Integer (Int32)}
     */
    static MB_NORMAL => 1

    /**
     * Native name: NAV_MB_HOT
     * @type {Integer (Int32)}
     */
    static MB_HOT => 2

    /**
     * Native name: NAV_MB_PRESSED
     * @type {Integer (Int32)}
     */
    static MB_PRESSED => 3

    /**
     * Native name: NAV_MB_DISABLED
     * @type {Integer (Int32)}
     */
    static MB_DISABLED => 4
}
