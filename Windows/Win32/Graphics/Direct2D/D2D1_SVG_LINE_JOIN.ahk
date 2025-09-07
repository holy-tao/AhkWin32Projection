#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies a value for the SVG stroke-linejoin property.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/ne-d2d1svg-d2d1_svg_line_join
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SVG_LINE_JOIN{

    /**
     * The property is set to SVG's 'bevel' value.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_LINE_JOIN_BEVEL => 1

    /**
     * The property is set to SVG's 'miter' value. Note that this is equivalent to D2D1_LINE_JOIN_MITER_OR_BEVEL, not D2D1_LINE_JOIN_MITER.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_LINE_JOIN_MITER => 3

    /**
     * The property is set to SVG's 'round' value.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_LINE_JOIN_ROUND => 2
}
