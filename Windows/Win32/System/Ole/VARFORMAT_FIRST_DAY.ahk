#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct VARFORMAT_FIRST_DAY {
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
    static VARFORMAT_FIRST_DAY_SYSTEMDEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_FIRST_DAY_MONDAY => 1

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_FIRST_DAY_TUESDAY => 2

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_FIRST_DAY_WEDNESDAY => 3

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_FIRST_DAY_THURSDAY => 4

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_FIRST_DAY_FRIDAY => 5

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_FIRST_DAY_SATURDAY => 6

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_FIRST_DAY_SUNDAY => 7
}
