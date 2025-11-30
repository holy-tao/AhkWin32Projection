#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class EDGE_GESTURE_KIND extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static EGK_TOUCH => 0

    /**
     * @type {Integer (Int32)}
     */
    static EGK_KEYBOARD => 1

    /**
     * @type {Integer (Int32)}
     */
    static EGK_MOUSE => 2
}
