#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RTC_ACE_SCOPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RTCAS_SCOPE_USER => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCAS_SCOPE_DOMAIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCAS_SCOPE_ALL => 2
}
