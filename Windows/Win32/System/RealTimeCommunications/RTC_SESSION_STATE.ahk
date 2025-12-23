#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RTC_SESSION_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RTCSS_IDLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCSS_INCOMING => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCSS_ANSWERING => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCSS_INPROGRESS => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCSS_CONNECTED => 4

    /**
     * @type {Integer (Int32)}
     */
    static RTCSS_DISCONNECTED => 5

    /**
     * @type {Integer (Int32)}
     */
    static RTCSS_HOLD => 6

    /**
     * @type {Integer (Int32)}
     */
    static RTCSS_REFER => 7
}
