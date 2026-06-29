#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct RTC_LISTEN_MODE {
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
    static RTCLM_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCLM_DYNAMIC => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCLM_BOTH => 2
}
