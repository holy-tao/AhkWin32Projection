#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct svgFecolormatrixType {
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
    static SVG_FECOLORMATRIX_TYPE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static SVG_FECOLORMATRIX_TYPE_MATRIX => 1

    /**
     * @type {Integer (Int32)}
     */
    static SVG_FECOLORMATRIX_TYPE_SATURATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SVG_FECOLORMATRIX_TYPE_HUEROTATE => 3

    /**
     * @type {Integer (Int32)}
     */
    static SVG_FECOLORMATRIX_TYPE_LUMINANCETOALPHA => 4

    /**
     * @type {Integer (Int32)}
     */
    static svgFecolormatrixType_Max => 2147483647
}
