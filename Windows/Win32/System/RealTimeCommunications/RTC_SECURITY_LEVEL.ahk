#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RTC_SECURITY_LEVEL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RTCSECL_UNSUPPORTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCSECL_SUPPORTED => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCSECL_REQUIRED => 3
}
