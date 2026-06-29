#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UDateAbsoluteUnit {
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
    static UDAT_ABSOLUTE_SUNDAY => 0

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_ABSOLUTE_MONDAY => 1

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_ABSOLUTE_TUESDAY => 2

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_ABSOLUTE_WEDNESDAY => 3

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_ABSOLUTE_THURSDAY => 4

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_ABSOLUTE_FRIDAY => 5

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_ABSOLUTE_SATURDAY => 6

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_ABSOLUTE_DAY => 7

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_ABSOLUTE_WEEK => 8

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_ABSOLUTE_MONTH => 9

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_ABSOLUTE_YEAR => 10

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_ABSOLUTE_NOW => 11

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_ABSOLUTE_UNIT_COUNT => 12
}
