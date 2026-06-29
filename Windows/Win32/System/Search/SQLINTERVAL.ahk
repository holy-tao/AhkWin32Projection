#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct SQLINTERVAL {
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
    static SQL_IS_YEAR => 1

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IS_MONTH => 2

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IS_DAY => 3

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IS_HOUR => 4

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IS_MINUTE => 5

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IS_SECOND => 6

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IS_YEAR_TO_MONTH => 7

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IS_DAY_TO_HOUR => 8

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IS_DAY_TO_MINUTE => 9

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IS_DAY_TO_SECOND => 10

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IS_HOUR_TO_MINUTE => 11

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IS_HOUR_TO_SECOND => 12

    /**
     * @type {Integer (Int32)}
     */
    static SQL_IS_MINUTE_TO_SECOND => 13
}
