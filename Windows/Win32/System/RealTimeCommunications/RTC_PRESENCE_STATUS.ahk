#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct RTC_PRESENCE_STATUS {
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
    static RTCXS_PRESENCE_OFFLINE => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCXS_PRESENCE_ONLINE => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCXS_PRESENCE_AWAY => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCXS_PRESENCE_IDLE => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCXS_PRESENCE_BUSY => 4

    /**
     * @type {Integer (Int32)}
     */
    static RTCXS_PRESENCE_BE_RIGHT_BACK => 5

    /**
     * @type {Integer (Int32)}
     */
    static RTCXS_PRESENCE_ON_THE_PHONE => 6

    /**
     * @type {Integer (Int32)}
     */
    static RTCXS_PRESENCE_OUT_TO_LUNCH => 7
}
