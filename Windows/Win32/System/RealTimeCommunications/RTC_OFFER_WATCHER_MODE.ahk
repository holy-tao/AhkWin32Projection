#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
class RTC_OFFER_WATCHER_MODE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static RTCOWM_OFFER_WATCHER_EVENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCOWM_AUTOMATICALLY_ADD_WATCHER => 1
}
