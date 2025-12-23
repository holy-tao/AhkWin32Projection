#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RTC_MEDIA_EVENT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RTCMET_STOPPED => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCMET_STARTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCMET_FAILED => 2
}
