#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RTC_PARTICIPANT_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RTCPS_IDLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCPS_PENDING => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCPS_INCOMING => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCPS_ANSWERING => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCPS_INPROGRESS => 4

    /**
     * @type {Integer (Int32)}
     */
    static RTCPS_ALERTING => 5

    /**
     * @type {Integer (Int32)}
     */
    static RTCPS_CONNECTED => 6

    /**
     * @type {Integer (Int32)}
     */
    static RTCPS_DISCONNECTING => 7

    /**
     * @type {Integer (Int32)}
     */
    static RTCPS_DISCONNECTED => 8
}
