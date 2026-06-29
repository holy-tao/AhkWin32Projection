#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct RTC_OFFER_WATCHER_MODE {
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
    static RTCOWM_OFFER_WATCHER_EVENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCOWM_AUTOMATICALLY_ADD_WATCHER => 1
}
