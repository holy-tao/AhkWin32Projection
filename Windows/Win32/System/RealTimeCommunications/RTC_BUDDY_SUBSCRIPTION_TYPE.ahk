#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RTC_BUDDY_SUBSCRIPTION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RTCBT_SUBSCRIBED => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCBT_ALWAYS_OFFLINE => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCBT_ALWAYS_ONLINE => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCBT_POLL => 3
}
