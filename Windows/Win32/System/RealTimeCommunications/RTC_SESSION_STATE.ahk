#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct RTC_SESSION_STATE {
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
    static RTCSS_IDLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCSS_INCOMING => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCSS_ANSWERING => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCSS_INPROGRESS => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCSS_CONNECTED => 4

    /**
     * @type {Integer (Int32)}
     */
    static RTCSS_DISCONNECTED => 5

    /**
     * @type {Integer (Int32)}
     */
    static RTCSS_HOLD => 6

    /**
     * @type {Integer (Int32)}
     */
    static RTCSS_REFER => 7
}
