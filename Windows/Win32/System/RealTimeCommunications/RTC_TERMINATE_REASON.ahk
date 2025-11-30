#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RTC_TERMINATE_REASON extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RTCTR_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCTR_DND => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCTR_BUSY => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCTR_REJECT => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCTR_TIMEOUT => 4

    /**
     * @type {Integer (Int32)}
     */
    static RTCTR_SHUTDOWN => 5

    /**
     * @type {Integer (Int32)}
     */
    static RTCTR_INSUFFICIENT_SECURITY_LEVEL => 6

    /**
     * @type {Integer (Int32)}
     */
    static RTCTR_NOT_SUPPORTED => 7
}
