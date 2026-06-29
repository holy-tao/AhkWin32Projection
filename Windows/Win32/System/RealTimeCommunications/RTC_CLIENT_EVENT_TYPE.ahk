#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct RTC_CLIENT_EVENT_TYPE {
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
    static RTCCET_VOLUME_CHANGE => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCCET_DEVICE_CHANGE => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCCET_NETWORK_QUALITY_CHANGE => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCCET_ASYNC_CLEANUP_DONE => 3
}
