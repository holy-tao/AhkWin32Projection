#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
class RTC_PROFILE_EVENT_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static RTCPFET_PROFILE_GET => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCPFET_PROFILE_UPDATE => 1
}
