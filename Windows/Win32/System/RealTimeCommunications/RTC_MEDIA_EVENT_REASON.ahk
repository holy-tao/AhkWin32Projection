#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct RTC_MEDIA_EVENT_REASON {
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
    static RTCMER_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCMER_HOLD => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCMER_TIMEOUT => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCMER_BAD_DEVICE => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCMER_NO_PORT => 4

    /**
     * @type {Integer (Int32)}
     */
    static RTCMER_PORT_MAPPING_FAILED => 5

    /**
     * @type {Integer (Int32)}
     */
    static RTCMER_REMOTE_REQUEST => 6
}
