#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleWritingMode {
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
    static styleWritingModeLrtb => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleWritingModeTbrl => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleWritingModeRltb => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleWritingModeBtrl => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleWritingModeNotSet => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleWritingModeTblr => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleWritingModeBtlr => 6

    /**
     * @type {Integer (Int32)}
     */
    static styleWritingModeLrbt => 7

    /**
     * @type {Integer (Int32)}
     */
    static styleWritingModeRlbt => 8

    /**
     * @type {Integer (Int32)}
     */
    static styleWritingModeLr => 9

    /**
     * @type {Integer (Int32)}
     */
    static styleWritingModeRl => 10

    /**
     * @type {Integer (Int32)}
     */
    static styleWritingModeTb => 11

    /**
     * @type {Integer (Int32)}
     */
    static styleWritingMode_Max => 2147483647
}
