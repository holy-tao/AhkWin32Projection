#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct svgPathSegType {
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
    static PATHSEG_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static PATHSEG_CLOSEPATH => 1

    /**
     * @type {Integer (Int32)}
     */
    static PATHSEG_MOVETO_ABS => 2

    /**
     * @type {Integer (Int32)}
     */
    static PATHSEG_MOVETO_REL => 3

    /**
     * @type {Integer (Int32)}
     */
    static PATHSEG_LINETO_ABS => 4

    /**
     * @type {Integer (Int32)}
     */
    static PATHSEG_LINETO_REL => 5

    /**
     * @type {Integer (Int32)}
     */
    static PATHSEG_CURVETO_CUBIC_ABS => 6

    /**
     * @type {Integer (Int32)}
     */
    static PATHSEG_CURVETO_CUBIC_REL => 7

    /**
     * @type {Integer (Int32)}
     */
    static PATHSEG_CURVETO_QUADRATIC_ABS => 8

    /**
     * @type {Integer (Int32)}
     */
    static PATHSEG_CURVETO_QUADRATIC_REL => 9

    /**
     * @type {Integer (Int32)}
     */
    static PATHSEG_ARC_ABS => 10

    /**
     * @type {Integer (Int32)}
     */
    static PATHSEG_ARC_REL => 11

    /**
     * @type {Integer (Int32)}
     */
    static PATHSEG_LINETO_HORIZONTAL_ABS => 12

    /**
     * @type {Integer (Int32)}
     */
    static PATHSEG_LINETO_HORIZONTAL_REL => 13

    /**
     * @type {Integer (Int32)}
     */
    static PATHSEG_LINETO_VERTICAL_ABS => 14

    /**
     * @type {Integer (Int32)}
     */
    static PATHSEG_LINETO_VERTICAL_REL => 15

    /**
     * @type {Integer (Int32)}
     */
    static PATHSEG_CURVETO_CUBIC_SMOOTH_ABS => 16

    /**
     * @type {Integer (Int32)}
     */
    static PATHSEG_CURVETO_CUBIC_SMOOTH_REL => 17

    /**
     * @type {Integer (Int32)}
     */
    static PATHSEG_CURVETO_QUADRATIC_SMOOTH_ABS => 18

    /**
     * @type {Integer (Int32)}
     */
    static PATHSEG_CURVETO_QUADRATIC_SMOOTH_REL => 19

    /**
     * @type {Integer (Int32)}
     */
    static svgPathSegType_Max => 2147483647
}
