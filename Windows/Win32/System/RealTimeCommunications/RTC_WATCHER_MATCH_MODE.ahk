#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct RTC_WATCHER_MATCH_MODE {
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
    static RTCWMM_EXACT_MATCH => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCWMM_BEST_ACE_MATCH => 1
}
