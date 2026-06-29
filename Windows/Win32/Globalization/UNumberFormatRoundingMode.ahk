#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UNumberFormatRoundingMode {
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
    static UNUM_ROUND_CEILING => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_ROUND_FLOOR => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_ROUND_DOWN => 2

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_ROUND_UP => 3

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_ROUND_HALFEVEN => 4

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_ROUND_HALFDOWN => 5

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_ROUND_HALFUP => 6

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_ROUND_UNNECESSARY => 7

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_ROUND_HALF_ODD => 8

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_ROUND_HALF_CEILING => 9

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_ROUND_HALF_FLOOR => 10
}
