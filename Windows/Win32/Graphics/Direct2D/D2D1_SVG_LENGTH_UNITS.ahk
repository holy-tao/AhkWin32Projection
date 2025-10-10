#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the units for an SVG length.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/ne-d2d1svg-d2d1_svg_length_units
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SVG_LENGTH_UNITS{

    /**
     * The length is unitless.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_LENGTH_UNITS_NUMBER => 0

    /**
     * The length is a percentage value.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_LENGTH_UNITS_PERCENTAGE => 1
}
