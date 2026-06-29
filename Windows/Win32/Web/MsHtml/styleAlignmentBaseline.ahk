#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleAlignmentBaseline {
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
    static styleAlignmentBaselineNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignmentBaselineAfterEdge => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignmentBaselineAlphabetic => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignmentBaselineAuto => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignmentBaselineBaseline => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignmentBaselineBeforeEdge => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignmentBaselineCentral => 6

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignmentBaselineHanging => 7

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignmentBaselineMathematical => 8

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignmentBaselineMiddle => 9

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignmentBaselineTextAfterEdge => 10

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignmentBaselineTextBeforeEdge => 11

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignmentBaselineIdeographic => 12

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignmentBaseline_Max => 2147483647
}
