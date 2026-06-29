#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UCalendarDaysOfWeek {
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
    static UCAL_SUNDAY => 1

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_MONDAY => 2

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_TUESDAY => 3

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_WEDNESDAY => 4

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_THURSDAY => 5

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_FRIDAY => 6

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_SATURDAY => 7
}
