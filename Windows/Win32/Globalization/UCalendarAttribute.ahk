#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UCalendarAttribute {
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
    static UCAL_LENIENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_FIRST_DAY_OF_WEEK => 1

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_MINIMAL_DAYS_IN_FIRST_WEEK => 2

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_REPEATED_WALL_TIME => 3

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_SKIPPED_WALL_TIME => 4
}
