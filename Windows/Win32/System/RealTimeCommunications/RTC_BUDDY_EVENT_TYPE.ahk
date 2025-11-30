#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RTC_BUDDY_EVENT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RTCBET_BUDDY_ADD => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCBET_BUDDY_REMOVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCBET_BUDDY_UPDATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCBET_BUDDY_STATE_CHANGE => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCBET_BUDDY_ROAMED => 4

    /**
     * @type {Integer (Int32)}
     */
    static RTCBET_BUDDY_SUBSCRIBED => 5
}
