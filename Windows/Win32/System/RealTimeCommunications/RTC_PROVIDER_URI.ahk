#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RTC_PROVIDER_URI extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RTCPU_URIHOMEPAGE => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCPU_URIHELPDESK => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCPU_URIPERSONALACCOUNT => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCPU_URIDISPLAYDURINGCALL => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCPU_URIDISPLAYDURINGIDLE => 4
}
