#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UTimeZoneLocalOption {
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
    static UCAL_TZ_LOCAL_FORMER => 4

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_TZ_LOCAL_LATTER => 12

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_TZ_LOCAL_STANDARD_FORMER => 5

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_TZ_LOCAL_STANDARD_LATTER => 13

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_TZ_LOCAL_DAYLIGHT_FORMER => 7

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_TZ_LOCAL_DAYLIGHT_LATTER => 15
}
