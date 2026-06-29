#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct RTC_DTMF {
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
    static RTC_DTMF_0 => 0

    /**
     * @type {Integer (Int32)}
     */
    static RTC_DTMF_1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTC_DTMF_2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTC_DTMF_3 => 3

    /**
     * @type {Integer (Int32)}
     */
    static RTC_DTMF_4 => 4

    /**
     * @type {Integer (Int32)}
     */
    static RTC_DTMF_5 => 5

    /**
     * @type {Integer (Int32)}
     */
    static RTC_DTMF_6 => 6

    /**
     * @type {Integer (Int32)}
     */
    static RTC_DTMF_7 => 7

    /**
     * @type {Integer (Int32)}
     */
    static RTC_DTMF_8 => 8

    /**
     * @type {Integer (Int32)}
     */
    static RTC_DTMF_9 => 9

    /**
     * @type {Integer (Int32)}
     */
    static RTC_DTMF_STAR => 10

    /**
     * @type {Integer (Int32)}
     */
    static RTC_DTMF_POUND => 11

    /**
     * @type {Integer (Int32)}
     */
    static RTC_DTMF_A => 12

    /**
     * @type {Integer (Int32)}
     */
    static RTC_DTMF_B => 13

    /**
     * @type {Integer (Int32)}
     */
    static RTC_DTMF_C => 14

    /**
     * @type {Integer (Int32)}
     */
    static RTC_DTMF_D => 15

    /**
     * @type {Integer (Int32)}
     */
    static RTC_DTMF_FLASH => 16
}
