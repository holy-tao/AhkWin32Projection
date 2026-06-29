#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UFieldCategory {
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
    static UFIELD_CATEGORY_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static UFIELD_CATEGORY_DATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static UFIELD_CATEGORY_NUMBER => 2

    /**
     * @type {Integer (Int32)}
     */
    static UFIELD_CATEGORY_LIST => 3

    /**
     * @type {Integer (Int32)}
     */
    static UFIELD_CATEGORY_RELATIVE_DATETIME => 4

    /**
     * @type {Integer (Int32)}
     */
    static UFIELD_CATEGORY_DATE_INTERVAL => 5

    /**
     * @type {Integer (Int32)}
     */
    static UFIELD_CATEGORY_LIST_SPAN => 4099

    /**
     * @type {Integer (Int32)}
     */
    static UFIELD_CATEGORY_DATE_INTERVAL_SPAN => 4101

    /**
     * @type {Integer (Int32)}
     */
    static UFIELD_CATEGORY_NUMBER_RANGE_SPAN => 4098
}
