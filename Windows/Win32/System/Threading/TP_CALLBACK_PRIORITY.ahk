#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 */
class TP_CALLBACK_PRIORITY extends Win32Enum {

    /**
     * Native name: TP_CALLBACK_PRIORITY_HIGH
     * @type {Integer (Int32)}
     */
    static HIGH => 0

    /**
     * Native name: TP_CALLBACK_PRIORITY_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 1

    /**
     * Native name: TP_CALLBACK_PRIORITY_LOW
     * @type {Integer (Int32)}
     */
    static LOW => 2

    /**
     * Native name: TP_CALLBACK_PRIORITY_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 3

    /**
     * Native name: TP_CALLBACK_PRIORITY_COUNT
     * @type {Integer (Int32)}
     */
    static COUNT => 3
}
