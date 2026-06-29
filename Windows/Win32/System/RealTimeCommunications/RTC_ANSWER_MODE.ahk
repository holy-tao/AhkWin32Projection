#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct RTC_ANSWER_MODE {
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
    static RTCAM_OFFER_SESSION_EVENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCAM_AUTOMATICALLY_ACCEPT => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCAM_AUTOMATICALLY_REJECT => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCAM_NOT_SUPPORTED => 3
}
