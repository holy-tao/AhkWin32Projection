#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct svgMorphologyOperator {
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
    static SVG_MORPHOLOGY_OPERATOR_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static SVG_MORPHOLOGY_OPERATOR_ERODE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SVG_MORPHOLOGY_OPERATOR_DILATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static svgMorphologyOperator_Max => 2147483647
}
