#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleFontWeight {
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
    static styleFontWeightNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleFontWeight100 => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleFontWeight200 => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleFontWeight300 => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleFontWeight400 => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleFontWeight500 => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleFontWeight600 => 6

    /**
     * @type {Integer (Int32)}
     */
    static styleFontWeight700 => 7

    /**
     * @type {Integer (Int32)}
     */
    static styleFontWeight800 => 8

    /**
     * @type {Integer (Int32)}
     */
    static styleFontWeight900 => 9

    /**
     * @type {Integer (Int32)}
     */
    static styleFontWeightNormal => 10

    /**
     * @type {Integer (Int32)}
     */
    static styleFontWeightBold => 11

    /**
     * @type {Integer (Int32)}
     */
    static styleFontWeightBolder => 12

    /**
     * @type {Integer (Int32)}
     */
    static styleFontWeightLighter => 13

    /**
     * @type {Integer (Int32)}
     */
    static styleFontWeight_Max => 2147483647
}
