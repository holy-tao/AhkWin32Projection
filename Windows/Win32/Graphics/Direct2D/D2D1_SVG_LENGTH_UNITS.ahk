#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the units for an SVG length.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/ne-d2d1svg-d2d1_svg_length_units
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_SVG_LENGTH_UNITS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
