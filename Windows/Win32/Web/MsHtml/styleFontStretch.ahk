#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleFontStretch {
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
    static styleFontStretchNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleFontStretchWider => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleFontStretchNarrower => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleFontStretchUltraCondensed => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleFontStretchExtraCondensed => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleFontStretchCondensed => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleFontStretchSemiCondensed => 6

    /**
     * @type {Integer (Int32)}
     */
    static styleFontStretchNormal => 7

    /**
     * @type {Integer (Int32)}
     */
    static styleFontStretchSemiExpanded => 8

    /**
     * @type {Integer (Int32)}
     */
    static styleFontStretchExpanded => 9

    /**
     * @type {Integer (Int32)}
     */
    static styleFontStretchExtraExpanded => 10

    /**
     * @type {Integer (Int32)}
     */
    static styleFontStretchUltraExpanded => 11

    /**
     * @type {Integer (Int32)}
     */
    static styleFontStretch_Max => 2147483647
}
