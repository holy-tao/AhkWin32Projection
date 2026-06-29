#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a value for the SVG overflow property.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/ne-d2d1svg-d2d1_svg_overflow
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_SVG_OVERFLOW {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
