#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class NAV_FORWARDBUTTONSTATES extends Win32Enum {

    /**
     * Native name: NAV_FB_NORMAL
     * @type {Integer (Int32)}
     */
    static FB_NORMAL => 1

    /**
     * Native name: NAV_FB_HOT
     * @type {Integer (Int32)}
     */
    static FB_HOT => 2

    /**
     * Native name: NAV_FB_PRESSED
     * @type {Integer (Int32)}
     */
    static FB_PRESSED => 3

    /**
     * Native name: NAV_FB_DISABLED
     * @type {Integer (Int32)}
     */
    static FB_DISABLED => 4
}
