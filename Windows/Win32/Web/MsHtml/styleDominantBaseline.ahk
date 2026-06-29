#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleDominantBaseline {
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
    static styleDominantBaselineNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleDominantBaselineAlphabetic => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleDominantBaselineAuto => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleDominantBaselineCentral => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleDominantBaselineHanging => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleDominantBaselineIdeographic => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleDominantBaselineMathematical => 6

    /**
     * @type {Integer (Int32)}
     */
    static styleDominantBaselineMiddle => 7

    /**
     * @type {Integer (Int32)}
     */
    static styleDominantBaselineNoChange => 8

    /**
     * @type {Integer (Int32)}
     */
    static styleDominantBaselineResetSize => 9

    /**
     * @type {Integer (Int32)}
     */
    static styleDominantBaselineTextAfterEdge => 10

    /**
     * @type {Integer (Int32)}
     */
    static styleDominantBaselineTextBeforeEdge => 11

    /**
     * @type {Integer (Int32)}
     */
    static styleDominantBaselineUseScript => 12

    /**
     * @type {Integer (Int32)}
     */
    static styleDominantBaseline_Max => 2147483647
}
