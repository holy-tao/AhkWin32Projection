#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
class CURSORINFO_FLAGS extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static CURSOR_SHOWING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CURSOR_SUPPRESSED => 2
}
