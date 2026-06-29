#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct RTC_USER_SEARCH_COLUMN {
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
    static RTCUSC_URI => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTCUSC_DISPLAYNAME => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCUSC_TITLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCUSC_OFFICE => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTCUSC_PHONE => 4

    /**
     * @type {Integer (Int32)}
     */
    static RTCUSC_COMPANY => 5

    /**
     * @type {Integer (Int32)}
     */
    static RTCUSC_CITY => 6

    /**
     * @type {Integer (Int32)}
     */
    static RTCUSC_STATE => 7

    /**
     * @type {Integer (Int32)}
     */
    static RTCUSC_COUNTRY => 8

    /**
     * @type {Integer (Int32)}
     */
    static RTCUSC_EMAIL => 9
}
