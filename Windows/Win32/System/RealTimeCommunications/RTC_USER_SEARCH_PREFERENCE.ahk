#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RTC_USER_SEARCH_PREFERENCE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RTCUSP_MAX_MATCHES => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCUSP_TIME_LIMIT => 1
}
