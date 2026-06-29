#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct RTC_BUDDY_EVENT_TYPE {
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
    static RTCBET_BUDDY_ADD => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCBET_BUDDY_REMOVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCBET_BUDDY_UPDATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCBET_BUDDY_STATE_CHANGE => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCBET_BUDDY_ROAMED => 4

    /**
     * @type {Integer (Int32)}
     */
    static RTCBET_BUDDY_SUBSCRIBED => 5
}
