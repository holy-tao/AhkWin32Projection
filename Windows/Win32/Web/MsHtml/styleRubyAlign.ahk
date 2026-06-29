#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleRubyAlign {
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
    static styleRubyAlignNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyAlignAuto => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyAlignLeft => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyAlignCenter => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyAlignRight => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyAlignDistributeLetter => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyAlignDistributeSpace => 6

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyAlignLineEdge => 7

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyAlign_Max => 2147483647
}
