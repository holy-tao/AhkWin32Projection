#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RTC_SESSION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RTCST_PC_TO_PC => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCST_PC_TO_PHONE => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCST_PHONE_TO_PHONE => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCST_IM => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCST_MULTIPARTY_IM => 4

    /**
     * @type {Integer (Int32)}
     */
    static RTCST_APPLICATION => 5
}
