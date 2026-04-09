#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
class RTC_SECURITY_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static RTCSECT_AUDIO_VIDEO_MEDIA_ENCRYPTION => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCSECT_T120_MEDIA_ENCRYPTION => 1
}
