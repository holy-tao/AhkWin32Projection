#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct htmlFrame {
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
    static htmlFrameNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlFramevoid => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlFrameabove => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlFramebelow => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlFramehsides => 4

    /**
     * @type {Integer (Int32)}
     */
    static htmlFramelhs => 5

    /**
     * @type {Integer (Int32)}
     */
    static htmlFramerhs => 6

    /**
     * @type {Integer (Int32)}
     */
    static htmlFramevsides => 7

    /**
     * @type {Integer (Int32)}
     */
    static htmlFramebox => 8

    /**
     * @type {Integer (Int32)}
     */
    static htmlFrameborder => 9

    /**
     * @type {Integer (Int32)}
     */
    static htmlFrame_Max => 2147483647
}
