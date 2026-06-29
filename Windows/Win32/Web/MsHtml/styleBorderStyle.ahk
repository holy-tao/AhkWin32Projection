#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleBorderStyle {
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
    static styleBorderStyleNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderStyleDotted => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderStyleDashed => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderStyleSolid => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderStyleDouble => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderStyleGroove => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderStyleRidge => 6

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderStyleInset => 7

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderStyleOutset => 8

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderStyleWindowInset => 9

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderStyleNone => 10

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderStyleHidden => 11

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderStyle_Max => 2147483647
}
