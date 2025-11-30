#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RTC_REINVITE_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RTCRIN_INCOMING => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCRIN_SUCCEEDED => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCRIN_FAIL => 2
}
