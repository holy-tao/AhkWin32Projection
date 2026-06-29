#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct RTC_BUDDY_SUBSCRIPTION_TYPE {
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
    static RTCBT_SUBSCRIBED => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCBT_ALWAYS_OFFLINE => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCBT_ALWAYS_ONLINE => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCBT_POLL => 3
}
