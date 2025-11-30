#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NAV_MENUBUTTONSTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NAV_MB_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static NAV_MB_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static NAV_MB_PRESSED => 3

    /**
     * @type {Integer (Int32)}
     */
    static NAV_MB_DISABLED => 4
}
