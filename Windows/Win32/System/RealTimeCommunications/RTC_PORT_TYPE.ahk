#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct RTC_PORT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
