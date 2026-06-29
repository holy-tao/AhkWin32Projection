#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleRubyOverhang {
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
    static styleRubyOverhangNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyOverhangAuto => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyOverhangWhitespace => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyOverhangNone => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleRubyOverhang_Max => 2147483647
}
