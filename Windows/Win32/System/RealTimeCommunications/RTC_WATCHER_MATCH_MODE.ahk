#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RTC_WATCHER_MATCH_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RTCWMM_EXACT_MATCH => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCWMM_BEST_ACE_MATCH => 1
}
