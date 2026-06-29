#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct svgLengthType {
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
    static SVG_LENGTHTYPE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static SVG_LENGTHTYPE_NUMBER => 1

    /**
     * @type {Integer (Int32)}
     */
    static SVG_LENGTHTYPE_PERCENTAGE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SVG_LENGTHTYPE_EMS => 3

    /**
     * @type {Integer (Int32)}
     */
    static SVG_LENGTHTYPE_EXS => 4

    /**
     * @type {Integer (Int32)}
     */
    static SVG_LENGTHTYPE_PX => 5

    /**
     * @type {Integer (Int32)}
     */
    static SVG_LENGTHTYPE_CM => 6

    /**
     * @type {Integer (Int32)}
     */
    static SVG_LENGTHTYPE_MM => 7

    /**
     * @type {Integer (Int32)}
     */
    static SVG_LENGTHTYPE_IN => 8

    /**
     * @type {Integer (Int32)}
     */
    static SVG_LENGTHTYPE_PT => 9

    /**
     * @type {Integer (Int32)}
     */
    static SVG_LENGTHTYPE_PC => 10

    /**
     * @type {Integer (Int32)}
     */
    static svgLengthType_Max => 2147483647
}
