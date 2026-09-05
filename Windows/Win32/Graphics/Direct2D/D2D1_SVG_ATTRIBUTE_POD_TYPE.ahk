#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the type of SVG POD attribute to set or get.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/ne-d2d1svg-d2d1_svg_attribute_pod_type
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_SVG_ATTRIBUTE_POD_TYPE extends Win32Enum {

    /**
     * The attribute is a FLOAT.
     * Native name: D2D1_SVG_ATTRIBUTE_POD_TYPE_FLOAT
     * @type {Integer (Int32)}
     */
    static FLOAT => 0

    /**
     * The attribute is a D2D1_COLOR_F.
     * Native name: D2D1_SVG_ATTRIBUTE_POD_TYPE_COLOR
     * @type {Integer (Int32)}
     */
    static COLOR => 1

    /**
     * The attribute is a D2D1_FILL_MODE.
     * Native name: D2D1_SVG_ATTRIBUTE_POD_TYPE_FILL_MODE
     * @type {Integer (Int32)}
     */
    static FILL_MODE => 2

    /**
     * The attribute is a D2D1_SVG_DISPLAY.
     * Native name: D2D1_SVG_ATTRIBUTE_POD_TYPE_DISPLAY
     * @type {Integer (Int32)}
     */
    static DISPLAY => 3

    /**
     * The attribute is a D2D1_SVG_OVERFLOW.
     * Native name: D2D1_SVG_ATTRIBUTE_POD_TYPE_OVERFLOW
     * @type {Integer (Int32)}
     */
    static OVERFLOW => 4

    /**
     * The attribute is a D2D1_SVG_LINE_CAP.
     * Native name: D2D1_SVG_ATTRIBUTE_POD_TYPE_LINE_CAP
     * @type {Integer (Int32)}
     */
    static LINE_CAP => 5

    /**
     * The attribute is a D2D1_SVG_LINE_JOIN.
     * Native name: D2D1_SVG_ATTRIBUTE_POD_TYPE_LINE_JOIN
     * @type {Integer (Int32)}
     */
    static LINE_JOIN => 6

    /**
     * The attribute is a D2D1_SVG_VISIBILITY.
     * Native name: D2D1_SVG_ATTRIBUTE_POD_TYPE_VISIBILITY
     * @type {Integer (Int32)}
     */
    static VISIBILITY => 7

    /**
     * The attribute is a D2D1_MATRIX_3X2_F.
     * Native name: D2D1_SVG_ATTRIBUTE_POD_TYPE_MATRIX
     * @type {Integer (Int32)}
     */
    static MATRIX => 8

    /**
     * The attribute is a D2D1_SVG_UNIT_TYPE.
     * Native name: D2D1_SVG_ATTRIBUTE_POD_TYPE_UNIT_TYPE
     * @type {Integer (Int32)}
     */
    static UNIT_TYPE => 9

    /**
     * The attribute is a D2D1_EXTEND_MODE.
     * Native name: D2D1_SVG_ATTRIBUTE_POD_TYPE_EXTEND_MODE
     * @type {Integer (Int32)}
     */
    static EXTEND_MODE => 10

    /**
     * The attribute is a D2D1_SVG_PRESERVE_ASPECT_RATIO.
     * Native name: D2D1_SVG_ATTRIBUTE_POD_TYPE_PRESERVE_ASPECT_RATIO
     * @type {Integer (Int32)}
     */
    static PRESERVE_ASPECT_RATIO => 11

    /**
     * The attribute is a D2D1_SVG_VIEWBOX.
     * Native name: D2D1_SVG_ATTRIBUTE_POD_TYPE_VIEWBOX
     * @type {Integer (Int32)}
     */
    static VIEWBOX => 12

    /**
     * The attribute is a D2D1_SVG_LENGTH.
     * Native name: D2D1_SVG_ATTRIBUTE_POD_TYPE_LENGTH
     * @type {Integer (Int32)}
     */
    static LENGTH => 13
}
