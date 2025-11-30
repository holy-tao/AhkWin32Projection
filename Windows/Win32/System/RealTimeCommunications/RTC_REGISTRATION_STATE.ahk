#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RTC_REGISTRATION_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RTCRS_NOT_REGISTERED => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCRS_REGISTERING => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCRS_REGISTERED => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCRS_REJECTED => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCRS_UNREGISTERING => 4

    /**
     * @type {Integer (Int32)}
     */
    static RTCRS_ERROR => 5

    /**
     * @type {Integer (Int32)}
     */
    static RTCRS_LOGGED_OFF => 6

    /**
     * @type {Integer (Int32)}
     */
    static RTCRS_LOCAL_PA_LOGGED_OFF => 7

    /**
     * @type {Integer (Int32)}
     */
    static RTCRS_REMOTE_PA_LOGGED_OFF => 8
}
