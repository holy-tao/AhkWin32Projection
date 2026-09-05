#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 */
class AVRT_PRIORITY extends Win32Enum {

    /**
     * Native name: AVRT_PRIORITY_VERYLOW
     * @type {Integer (Int32)}
     */
    static VERYLOW => -2

    /**
     * Native name: AVRT_PRIORITY_LOW
     * @type {Integer (Int32)}
     */
    static LOW => -1

    /**
     * Native name: AVRT_PRIORITY_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 0

    /**
     * Native name: AVRT_PRIORITY_HIGH
     * @type {Integer (Int32)}
     */
    static HIGH => 1

    /**
     * Native name: AVRT_PRIORITY_CRITICAL
     * @type {Integer (Int32)}
     */
    static CRITICAL => 2
}
