#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
class FOREGROUND_WINDOW_LOCK_CODE extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static LSFW_LOCK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LSFW_UNLOCK => 2
}
