#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a value for the SVG stroke-linecap property.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/ne-d2d1svg-d2d1_svg_line_cap
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_SVG_LINE_CAP {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
