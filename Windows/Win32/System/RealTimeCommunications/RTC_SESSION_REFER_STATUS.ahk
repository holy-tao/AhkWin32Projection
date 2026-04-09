#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
class RTC_SESSION_REFER_STATUS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static RTCSRS_REFERRING => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCSRS_ACCEPTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCSRS_ERROR => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCSRS_REJECTED => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCSRS_DROPPED => 4

    /**
     * @type {Integer (Int32)}
     */
    static RTCSRS_DONE => 5
}
