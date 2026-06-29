#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct RTC_PRESENCE_PROPERTY {
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
    static RTCPP_PHONENUMBER => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCPP_DISPLAYNAME => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCPP_EMAIL => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCPP_DEVICE_NAME => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCPP_MULTIPLE => 4
}
