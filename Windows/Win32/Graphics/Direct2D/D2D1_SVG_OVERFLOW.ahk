#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies a value for the SVG overflow property.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/ne-d2d1svg-d2d1_svg_overflow
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SVG_OVERFLOW{

    /**
     * The element is not clipped to its viewport.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_OVERFLOW_VISIBLE => 0

    /**
     * The element is clipped to its viewport.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_OVERFLOW_HIDDEN => 1
}
