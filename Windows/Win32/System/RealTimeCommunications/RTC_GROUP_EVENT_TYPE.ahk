#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RTC_GROUP_EVENT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RTCGET_GROUP_ADD => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCGET_GROUP_REMOVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCGET_GROUP_UPDATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCGET_GROUP_BUDDY_ADD => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCGET_GROUP_BUDDY_REMOVE => 4

    /**
     * @type {Integer (Int32)}
     */
    static RTCGET_GROUP_ROAMED => 5
}
