#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the units of a time span.
 * @see https://learn.microsoft.com/windows/win32/api/celib/ne-celib-enum_period
 * @namespace Windows.Win32.Security
 */
export default struct ENUM_PERIOD {
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
    static ENUM_PERIOD_INVALID => -1

    /**
     * @type {Integer (Int32)}
     */
    static ENUM_PERIOD_SECONDS => 0

    /**
     * @type {Integer (Int32)}
     */
    static ENUM_PERIOD_MINUTES => 1

    /**
     * @type {Integer (Int32)}
     */
    static ENUM_PERIOD_HOURS => 2

    /**
     * @type {Integer (Int32)}
     */
    static ENUM_PERIOD_DAYS => 3

    /**
     * @type {Integer (Int32)}
     */
    static ENUM_PERIOD_WEEKS => 4

    /**
     * @type {Integer (Int32)}
     */
    static ENUM_PERIOD_MONTHS => 5

    /**
     * @type {Integer (Int32)}
     */
    static ENUM_PERIOD_YEARS => 6
}
