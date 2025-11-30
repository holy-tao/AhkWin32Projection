#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RTC_PRESENCE_PROPERTY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RTCPP_PHONENUMBER => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCPP_DISPLAYNAME => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCPP_EMAIL => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCPP_DEVICE_NAME => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCPP_MULTIPLE => 4
}
