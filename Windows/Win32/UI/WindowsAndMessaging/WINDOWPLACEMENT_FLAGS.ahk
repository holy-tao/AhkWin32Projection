#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class WINDOWPLACEMENT_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static WPF_ASYNCWINDOWPLACEMENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WPF_RESTORETOMAXIMIZED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WPF_SETMINPOSITION => 1
}
