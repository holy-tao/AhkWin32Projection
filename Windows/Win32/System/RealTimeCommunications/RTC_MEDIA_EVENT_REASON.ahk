#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RTC_MEDIA_EVENT_REASON extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RTCMER_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCMER_HOLD => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCMER_TIMEOUT => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCMER_BAD_DEVICE => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCMER_NO_PORT => 4

    /**
     * @type {Integer (Int32)}
     */
    static RTCMER_PORT_MAPPING_FAILED => 5

    /**
     * @type {Integer (Int32)}
     */
    static RTCMER_REMOTE_REQUEST => 6
}
