#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the type of SVG POD attribute to set or get.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/ne-d2d1svg-d2d1_svg_attribute_pod_type
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SVG_ATTRIBUTE_POD_TYPE{

    /**
     * The attribute is a FLOAT.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ATTRIBUTE_POD_TYPE_FLOAT => 0

    /**
     * The attribute is a D2D1_COLOR_F.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ATTRIBUTE_POD_TYPE_COLOR => 1

    /**
     * The attribute is a D2D1_FILL_MODE.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ATTRIBUTE_POD_TYPE_FILL_MODE => 2

    /**
     * The attribute is a D2D1_SVG_DISPLAY.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ATTRIBUTE_POD_TYPE_DISPLAY => 3

    /**
     * The attribute is a D2D1_SVG_OVERFLOW.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ATTRIBUTE_POD_TYPE_OVERFLOW => 4

    /**
     * The attribute is a D2D1_SVG_LINE_CAP.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ATTRIBUTE_POD_TYPE_LINE_CAP => 5

    /**
     * The attribute is a D2D1_SVG_LINE_JOIN.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ATTRIBUTE_POD_TYPE_LINE_JOIN => 6

    /**
     * The attribute is a D2D1_SVG_VISIBILITY.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ATTRIBUTE_POD_TYPE_VISIBILITY => 7

    /**
     * The attribute is a D2D1_MATRIX_3X2_F.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ATTRIBUTE_POD_TYPE_MATRIX => 8

    /**
     * The attribute is a D2D1_SVG_UNIT_TYPE.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ATTRIBUTE_POD_TYPE_UNIT_TYPE => 9

    /**
     * The attribute is a D2D1_EXTEND_MODE.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ATTRIBUTE_POD_TYPE_EXTEND_MODE => 10

    /**
     * The attribute is a D2D1_SVG_PRESERVE_ASPECT_RATIO.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ATTRIBUTE_POD_TYPE_PRESERVE_ASPECT_RATIO => 11

    /**
     * The attribute is a D2D1_SVG_VIEWBOX.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ATTRIBUTE_POD_TYPE_VIEWBOX => 12

    /**
     * The attribute is a D2D1_SVG_LENGTH.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ATTRIBUTE_POD_TYPE_LENGTH => 13
}
