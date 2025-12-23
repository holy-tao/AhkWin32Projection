#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class RTC_PORT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RTCPT_AUDIO_RTP => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCPT_AUDIO_RTCP => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCPT_VIDEO_RTP => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCPT_VIDEO_RTCP => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCPT_SIP => 4
}
