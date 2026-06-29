#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleFontSize {
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
    static styleFontSizeXXSmall => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleFontSizeXSmall => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleFontSizeSmall => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleFontSizeMedium => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleFontSizeLarge => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleFontSizeXLarge => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleFontSizeXXLarge => 6

    /**
     * @type {Integer (Int32)}
     */
    static styleFontSizeSmaller => 7

    /**
     * @type {Integer (Int32)}
     */
    static styleFontSizeLarger => 8

    /**
     * @type {Integer (Int32)}
     */
    static styleFontSize_Max => 2147483647
}
