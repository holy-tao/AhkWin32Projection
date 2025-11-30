#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RTC_CLIENT_EVENT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RTCCET_VOLUME_CHANGE => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCCET_DEVICE_CHANGE => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCCET_NETWORK_QUALITY_CHANGE => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCCET_ASYNC_CLEANUP_DONE => 3
}
