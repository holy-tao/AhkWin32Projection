#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleFontStyle {
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
    static styleFontStyleNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleFontStyleItalic => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleFontStyleOblique => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleFontStyleNormal => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleFontStyle_Max => 2147483647
}
