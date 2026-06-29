#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleListStyleType {
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
    static styleListStyleTypeNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleListStyleTypeDisc => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleListStyleTypeCircle => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleListStyleTypeSquare => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleListStyleTypeDecimal => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleListStyleTypeLowerRoman => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleListStyleTypeUpperRoman => 6

    /**
     * @type {Integer (Int32)}
     */
    static styleListStyleTypeLowerAlpha => 7

    /**
     * @type {Integer (Int32)}
     */
    static styleListStyleTypeUpperAlpha => 8

    /**
     * @type {Integer (Int32)}
     */
    static styleListStyleTypeNone => 9

    /**
     * @type {Integer (Int32)}
     */
    static styleListStyleTypeDecimalLeadingZero => 10

    /**
     * @type {Integer (Int32)}
     */
    static styleListStyleTypeGeorgian => 11

    /**
     * @type {Integer (Int32)}
     */
    static styleListStyleTypeArmenian => 12

    /**
     * @type {Integer (Int32)}
     */
    static styleListStyleTypeUpperLatin => 13

    /**
     * @type {Integer (Int32)}
     */
    static styleListStyleTypeLowerLatin => 14

    /**
     * @type {Integer (Int32)}
     */
    static styleListStyleTypeUpperGreek => 15

    /**
     * @type {Integer (Int32)}
     */
    static styleListStyleTypeLowerGreek => 16

    /**
     * @type {Integer (Int32)}
     */
    static styleListStyleType_Max => 2147483647
}
