#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RTC_WATCHER_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RTCWS_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCWS_OFFERING => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCWS_ALLOWED => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCWS_BLOCKED => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCWS_DENIED => 4

    /**
     * @type {Integer (Int32)}
     */
    static RTCWS_PROMPT => 5
}
