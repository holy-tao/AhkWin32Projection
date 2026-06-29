#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct svgPreserveAspectRatioAlignType {
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
    static SVG_PRESERVEASPECTRATIO_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static SVG_PRESERVEASPECTRATIO_NONE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SVG_PRESERVEASPECTRATIO_XMINYMIN => 2

    /**
     * @type {Integer (Int32)}
     */
    static SVG_PRESERVEASPECTRATIO_XMIDYMIN => 3

    /**
     * @type {Integer (Int32)}
     */
    static SVG_PRESERVEASPECTRATIO_XMAXYMIN => 4

    /**
     * @type {Integer (Int32)}
     */
    static SVG_PRESERVEASPECTRATIO_XMINYMID => 5

    /**
     * @type {Integer (Int32)}
     */
    static SVG_PRESERVEASPECTRATIO_XMIDYMID => 6

    /**
     * @type {Integer (Int32)}
     */
    static SVG_PRESERVEASPECTRATIO_XMAXYMID => 7

    /**
     * @type {Integer (Int32)}
     */
    static SVG_PRESERVEASPECTRATIO_XMINYMAX => 8

    /**
     * @type {Integer (Int32)}
     */
    static SVG_PRESERVEASPECTRATIO_XMIDYMAX => 9

    /**
     * @type {Integer (Int32)}
     */
    static SVG_PRESERVEASPECTRATIO_XMAXYMAX => 10

    /**
     * @type {Integer (Int32)}
     */
    static svgPreserveAspectRatioAlignType_Max => 2147483647
}
