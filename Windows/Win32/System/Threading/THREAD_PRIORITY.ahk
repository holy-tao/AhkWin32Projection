#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class THREAD_PRIORITY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static THREAD_MODE_BACKGROUND_BEGIN => 65536

    /**
     * @type {Integer (Int32)}
     */
    static THREAD_MODE_BACKGROUND_END => 131072

    /**
     * @type {Integer (Int32)}
     */
    static THREAD_PRIORITY_ABOVE_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static THREAD_PRIORITY_BELOW_NORMAL => -1

    /**
     * @type {Integer (Int32)}
     */
    static THREAD_PRIORITY_HIGHEST => 2

    /**
     * @type {Integer (Int32)}
     */
    static THREAD_PRIORITY_IDLE => -15

    /**
     * @type {Integer (Int32)}
     */
    static THREAD_PRIORITY_MIN => -2

    /**
     * @type {Integer (Int32)}
     */
    static THREAD_PRIORITY_LOWEST => -2

    /**
     * @type {Integer (Int32)}
     */
    static THREAD_PRIORITY_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static THREAD_PRIORITY_TIME_CRITICAL => 15
}
