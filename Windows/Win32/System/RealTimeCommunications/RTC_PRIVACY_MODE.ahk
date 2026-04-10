#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
class RTC_PRIVACY_MODE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static RTCPM_BLOCK_LIST_EXCLUDED => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCPM_ALLOW_LIST_ONLY => 1
}
