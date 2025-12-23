#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RTC_LISTEN_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RTCLM_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCLM_DYNAMIC => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCLM_BOTH => 2
}
