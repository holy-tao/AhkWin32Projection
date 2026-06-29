#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct VARFORMAT_FIRST_WEEK {
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
    static VARFORMAT_FIRST_WEEK_SYSTEMDEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_FIRST_WEEK_CONTAINS_JANUARY_FIRST => 1

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_FIRST_WEEK_LARGER_HALF_IN_CURRENT_YEAR => 2

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_FIRST_WEEK_HAS_SEVEN_DAYS => 3
}
