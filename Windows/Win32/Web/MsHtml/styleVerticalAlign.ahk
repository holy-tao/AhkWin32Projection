#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleVerticalAlign {
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
    static styleVerticalAlignAuto => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleVerticalAlignBaseline => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleVerticalAlignSub => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleVerticalAlignSuper => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleVerticalAlignTop => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleVerticalAlignTextTop => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleVerticalAlignMiddle => 6

    /**
     * @type {Integer (Int32)}
     */
    static styleVerticalAlignBottom => 7

    /**
     * @type {Integer (Int32)}
     */
    static styleVerticalAlignTextBottom => 8

    /**
     * @type {Integer (Int32)}
     */
    static styleVerticalAlignInherit => 9

    /**
     * @type {Integer (Int32)}
     */
    static styleVerticalAlignNotSet => 10

    /**
     * @type {Integer (Int32)}
     */
    static styleVerticalAlign_Max => 2147483647
}
