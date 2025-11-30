#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RTC_ROAMING_EVENT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RTCRET_BUDDY_ROAMING => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCRET_WATCHER_ROAMING => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCRET_PRESENCE_ROAMING => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCRET_PROFILE_ROAMING => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCRET_WPENDING_ROAMING => 4
}
