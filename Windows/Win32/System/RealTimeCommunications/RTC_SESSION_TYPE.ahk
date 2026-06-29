#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct RTC_SESSION_TYPE {
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
    static RTCST_PC_TO_PC => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCST_PC_TO_PHONE => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCST_PHONE_TO_PHONE => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCST_IM => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCST_MULTIPARTY_IM => 4

    /**
     * @type {Integer (Int32)}
     */
    static RTCST_APPLICATION => 5
}
