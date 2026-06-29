#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct RTC_PARTICIPANT_STATE {
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
    static RTCPS_IDLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCPS_PENDING => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCPS_INCOMING => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCPS_ANSWERING => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCPS_INPROGRESS => 4

    /**
     * @type {Integer (Int32)}
     */
    static RTCPS_ALERTING => 5

    /**
     * @type {Integer (Int32)}
     */
    static RTCPS_CONNECTED => 6

    /**
     * @type {Integer (Int32)}
     */
    static RTCPS_DISCONNECTING => 7

    /**
     * @type {Integer (Int32)}
     */
    static RTCPS_DISCONNECTED => 8
}
