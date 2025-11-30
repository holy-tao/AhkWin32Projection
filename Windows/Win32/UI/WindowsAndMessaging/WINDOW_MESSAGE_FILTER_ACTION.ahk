#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class WINDOW_MESSAGE_FILTER_ACTION extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static MSGFLT_ALLOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MSGFLT_DISALLOW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MSGFLT_RESET => 0
}
