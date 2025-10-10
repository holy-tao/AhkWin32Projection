#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the paint type for an SVG fill or stroke.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/ne-d2d1svg-d2d1_svg_paint_type
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SVG_PAINT_TYPE{

    /**
     * The fill or stroke is not rendered.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_PAINT_TYPE_NONE => 0

    /**
     * A solid color is rendered.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_PAINT_TYPE_COLOR => 1

    /**
     * The current color is rendered.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_PAINT_TYPE_CURRENT_COLOR => 2

    /**
     * A paint server, defined by another element in the SVG document, is used.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_PAINT_TYPE_URI => 3

    /**
     * A paint server, defined by another element in the SVG document, is used. If the paint server reference is invalid, fall back to D2D1_SVG_PAINT_TYPE_NONE.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_PAINT_TYPE_URI_NONE => 4

    /**
     * A paint server, defined by another element in the SVG document, is used. If the paint server reference is invalid, fall back to D2D1_SVG_PAINT_TYPE_COLOR.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_PAINT_TYPE_URI_COLOR => 5

    /**
     * A paint server, defined by another element in the SVG document, is used. If the paint server reference is invalid, fall back to D2D1_SVG_PAINT_TYPE_CURRENT_COLOR.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_PAINT_TYPE_URI_CURRENT_COLOR => 6
}
