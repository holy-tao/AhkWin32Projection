#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the paint type for an SVG fill or stroke.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/ne-d2d1svg-d2d1_svg_paint_type
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_SVG_PAINT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
