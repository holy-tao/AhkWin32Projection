#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 */
class THREAD_PRIORITY extends Win32Enum {

    /**
     * Native name: THREAD_MODE_BACKGROUND_BEGIN
     * @type {Integer (Int32)}
     */
    static MODE_BACKGROUND_BEGIN => 65536

    /**
     * Native name: THREAD_MODE_BACKGROUND_END
     * @type {Integer (Int32)}
     */
    static MODE_BACKGROUND_END => 131072

    /**
     * Native name: THREAD_PRIORITY_ABOVE_NORMAL
     * @type {Integer (Int32)}
     */
    static ABOVE_NORMAL => 1

    /**
     * Native name: THREAD_PRIORITY_BELOW_NORMAL
     * @type {Integer (Int32)}
     */
    static BELOW_NORMAL => -1

    /**
     * Native name: THREAD_PRIORITY_HIGHEST
     * @type {Integer (Int32)}
     */
    static HIGHEST => 2

    /**
     * Native name: THREAD_PRIORITY_IDLE
     * @type {Integer (Int32)}
     */
    static IDLE => -15

    /**
     * Native name: THREAD_PRIORITY_MIN
     * @type {Integer (Int32)}
     */
    static MIN => -2

    /**
     * Native name: THREAD_PRIORITY_LOWEST
     * @type {Integer (Int32)}
     */
    static LOWEST => -2

    /**
     * Native name: THREAD_PRIORITY_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 0

    /**
     * Native name: THREAD_PRIORITY_TIME_CRITICAL
     * @type {Integer (Int32)}
     */
    static TIME_CRITICAL => 15
}
