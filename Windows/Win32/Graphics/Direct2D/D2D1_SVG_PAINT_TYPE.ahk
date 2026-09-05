#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the paint type for an SVG fill or stroke.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/ne-d2d1svg-d2d1_svg_paint_type
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_SVG_PAINT_TYPE extends Win32Enum {

    /**
     * The fill or stroke is not rendered.
     * Native name: D2D1_SVG_PAINT_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * A solid color is rendered.
     * Native name: D2D1_SVG_PAINT_TYPE_COLOR
     * @type {Integer (Int32)}
     */
    static COLOR => 1

    /**
     * The current color is rendered.
     * Native name: D2D1_SVG_PAINT_TYPE_CURRENT_COLOR
     * @type {Integer (Int32)}
     */
    static CURRENT_COLOR => 2

    /**
     * A paint server, defined by another element in the SVG document, is used.
     * Native name: D2D1_SVG_PAINT_TYPE_URI
     * @type {Integer (Int32)}
     */
    static URI => 3

    /**
     * A paint server, defined by another element in the SVG document, is used. If the paint server reference is invalid, fall back to D2D1_SVG_PAINT_TYPE_NONE.
     * Native name: D2D1_SVG_PAINT_TYPE_URI_NONE
     * @type {Integer (Int32)}
     */
    static URI_NONE => 4

    /**
     * A paint server, defined by another element in the SVG document, is used. If the paint server reference is invalid, fall back to D2D1_SVG_PAINT_TYPE_COLOR.
     * Native name: D2D1_SVG_PAINT_TYPE_URI_COLOR
     * @type {Integer (Int32)}
     */
    static URI_COLOR => 5

    /**
     * A paint server, defined by another element in the SVG document, is used. If the paint server reference is invalid, fall back to D2D1_SVG_PAINT_TYPE_CURRENT_COLOR.
     * Native name: D2D1_SVG_PAINT_TYPE_URI_CURRENT_COLOR
     * @type {Integer (Int32)}
     */
    static URI_CURRENT_COLOR => 6
}
