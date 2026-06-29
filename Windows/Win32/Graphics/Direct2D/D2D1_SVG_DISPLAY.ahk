#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a value for the SVG display property.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/ne-d2d1svg-d2d1_svg_display
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_SVG_DISPLAY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The element uses the default display behavior.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_DISPLAY_INLINE => 0

    /**
     * The element and all children are not rendered directly.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_DISPLAY_NONE => 1
}
