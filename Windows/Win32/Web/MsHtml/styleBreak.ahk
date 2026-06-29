#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleBreak {
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
    static styleBreakNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleBreakAuto => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleBreakAlways => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleBreakAvoid => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleBreakLeft => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleBreakRight => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleBreakPage => 6

    /**
     * @type {Integer (Int32)}
     */
    static styleBreakColumn => 7

    /**
     * @type {Integer (Int32)}
     */
    static styleBreakAvoidPage => 8

    /**
     * @type {Integer (Int32)}
     */
    static styleBreakAvoidColumn => 9

    /**
     * @type {Integer (Int32)}
     */
    static styleBreak_Max => 2147483647
}
