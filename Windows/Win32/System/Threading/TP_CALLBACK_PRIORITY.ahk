#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class TP_CALLBACK_PRIORITY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TP_CALLBACK_PRIORITY_HIGH => 0

    /**
     * @type {Integer (Int32)}
     */
    static TP_CALLBACK_PRIORITY_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static TP_CALLBACK_PRIORITY_LOW => 2

    /**
     * @type {Integer (Int32)}
     */
    static TP_CALLBACK_PRIORITY_INVALID => 3

    /**
     * @type {Integer (Int32)}
     */
    static TP_CALLBACK_PRIORITY_COUNT => 3
}
