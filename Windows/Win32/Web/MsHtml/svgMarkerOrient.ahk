#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct svgMarkerOrient {
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
    static SVG_MARKER_ORIENT_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static SVG_MARKER_ORIENT_AUTO => 1

    /**
     * @type {Integer (Int32)}
     */
    static SVG_MARKER_ORIENT_ANGLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static svgMarkerOrient_Max => 2147483647
}
