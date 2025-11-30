#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a value for the SVG stroke-linecap property.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/ne-d2d1svg-d2d1_svg_line_cap
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SVG_LINE_CAP extends Win32Enum{

    /**
     * The property is set to SVG's 'butt' value.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_LINE_CAP_BUTT => 0

    /**
     * The property is set to SVG's 'square' value.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_LINE_CAP_SQUARE => 1

    /**
     * The property is set to SVG's 'round' value.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_LINE_CAP_ROUND => 2
}
