#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines how to interpolate between colors.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ne-d2d1_1-d2d1_color_interpolation_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_COLOR_INTERPOLATION_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Colors are interpolated with straight alpha.
     * @type {Integer (Int32)}
     */
    static D2D1_COLOR_INTERPOLATION_MODE_STRAIGHT => 0

    /**
     * Colors are interpolated with premultiplied alpha.
     * @type {Integer (Int32)}
     */
    static D2D1_COLOR_INTERPOLATION_MODE_PREMULTIPLIED => 1
}
