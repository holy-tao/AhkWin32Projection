#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a value for the SVG visibility property.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/ne-d2d1svg-d2d1_svg_visibility
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_SVG_VISIBILITY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The element is visible.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_VISIBILITY_VISIBLE => 0

    /**
     * The element is invisible.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_VISIBILITY_HIDDEN => 1
}
