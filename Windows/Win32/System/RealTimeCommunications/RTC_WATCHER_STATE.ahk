#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct RTC_WATCHER_STATE {
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
    static RTCWS_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCWS_OFFERING => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCWS_ALLOWED => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCWS_BLOCKED => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCWS_DENIED => 4

    /**
     * @type {Integer (Int32)}
     */
    static RTCWS_PROMPT => 5
}
