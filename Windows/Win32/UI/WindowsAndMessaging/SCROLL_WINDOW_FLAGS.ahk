#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class SCROLL_WINDOW_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static SW_SCROLLCHILDREN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SW_INVALIDATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SW_ERASE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SW_SMOOTHSCROLL => 16
}
