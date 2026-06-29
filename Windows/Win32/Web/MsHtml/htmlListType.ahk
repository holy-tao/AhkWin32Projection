#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct htmlListType {
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
    static htmlListTypeNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlListTypeLargeAlpha => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlListTypeSmallAlpha => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlListTypeLargeRoman => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlListTypeSmallRoman => 4

    /**
     * @type {Integer (Int32)}
     */
    static htmlListTypeNumbers => 5

    /**
     * @type {Integer (Int32)}
     */
    static htmlListTypeDisc => 6

    /**
     * @type {Integer (Int32)}
     */
    static htmlListTypeCircle => 7

    /**
     * @type {Integer (Int32)}
     */
    static htmlListTypeSquare => 8

    /**
     * @type {Integer (Int32)}
     */
    static htmlListType_Max => 2147483647
}
