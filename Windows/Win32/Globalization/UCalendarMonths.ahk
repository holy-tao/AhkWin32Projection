#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UCalendarMonths {
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
    static UCAL_JANUARY => 0

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_FEBRUARY => 1

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_MARCH => 2

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_APRIL => 3

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_MAY => 4

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_JUNE => 5

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_JULY => 6

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_AUGUST => 7

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_SEPTEMBER => 8

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_OCTOBER => 9

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_NOVEMBER => 10

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_DECEMBER => 11

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_UNDECIMBER => 12
}
