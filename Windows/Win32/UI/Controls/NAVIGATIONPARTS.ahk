#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class NAVIGATIONPARTS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static NAV_BACKBUTTON => 1

    /**
     * @type {Integer (Int32)}
     */
    static NAV_FORWARDBUTTON => 2

    /**
     * @type {Integer (Int32)}
     */
    static NAV_MENUBUTTON => 3
}
