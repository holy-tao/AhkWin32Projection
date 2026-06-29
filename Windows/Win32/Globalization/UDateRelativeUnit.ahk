#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UDateRelativeUnit {
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
    static UDAT_RELATIVE_SECONDS => 0

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_RELATIVE_MINUTES => 1

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_RELATIVE_HOURS => 2

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_RELATIVE_DAYS => 3

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_RELATIVE_WEEKS => 4

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_RELATIVE_MONTHS => 5

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_RELATIVE_YEARS => 6

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_RELATIVE_UNIT_COUNT => 7
}
