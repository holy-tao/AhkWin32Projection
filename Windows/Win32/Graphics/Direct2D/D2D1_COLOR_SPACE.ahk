#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines options that should be applied to the color space.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ne-d2d1_1-d2d1_color_space
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_COLOR_SPACE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The color space is otherwise described, such as with a color profile.
     * @type {Integer (Int32)}
     */
    static D2D1_COLOR_SPACE_CUSTOM => 0

    /**
     * The color space is sRGB.
     * @type {Integer (Int32)}
     */
    static D2D1_COLOR_SPACE_SRGB => 1

    /**
     * The color space is scRGB.
     * @type {Integer (Int32)}
     */
    static D2D1_COLOR_SPACE_SCRGB => 2
}
