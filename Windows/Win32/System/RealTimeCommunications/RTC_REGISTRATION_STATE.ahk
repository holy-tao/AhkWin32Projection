#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct RTC_REGISTRATION_STATE {
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
    static RTCRS_NOT_REGISTERED => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCRS_REGISTERING => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCRS_REGISTERED => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCRS_REJECTED => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCRS_UNREGISTERING => 4

    /**
     * @type {Integer (Int32)}
     */
    static RTCRS_ERROR => 5

    /**
     * @type {Integer (Int32)}
     */
    static RTCRS_LOGGED_OFF => 6

    /**
     * @type {Integer (Int32)}
     */
    static RTCRS_LOCAL_PA_LOGGED_OFF => 7

    /**
     * @type {Integer (Int32)}
     */
    static RTCRS_REMOTE_PA_LOGGED_OFF => 8
}
