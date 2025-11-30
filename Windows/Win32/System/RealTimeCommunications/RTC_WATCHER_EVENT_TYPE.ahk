#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RTC_WATCHER_EVENT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RTCWET_WATCHER_ADD => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCWET_WATCHER_REMOVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCWET_WATCHER_UPDATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCWET_WATCHER_OFFERING => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCWET_WATCHER_ROAMED => 4
}
