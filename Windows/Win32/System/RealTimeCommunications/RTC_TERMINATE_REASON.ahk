#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct RTC_TERMINATE_REASON {
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
    static RTCTR_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCTR_DND => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCTR_BUSY => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCTR_REJECT => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCTR_TIMEOUT => 4

    /**
     * @type {Integer (Int32)}
     */
    static RTCTR_SHUTDOWN => 5

    /**
     * @type {Integer (Int32)}
     */
    static RTCTR_INSUFFICIENT_SECURITY_LEVEL => 6

    /**
     * @type {Integer (Int32)}
     */
    static RTCTR_NOT_SUPPORTED => 7
}
