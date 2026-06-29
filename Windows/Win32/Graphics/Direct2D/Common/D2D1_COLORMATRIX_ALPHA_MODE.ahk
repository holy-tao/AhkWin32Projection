#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The alpha mode of the output of the Color matrix effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_colormatrix_alpha_mode
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 */
export default struct D2D1_COLORMATRIX_ALPHA_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The effect un-premultiplies the input, applies the color matrix, and premultiplies the output.
     * @type {Integer (Int32)}
     */
    static D2D1_COLORMATRIX_ALPHA_MODE_PREMULTIPLIED => 1

    /**
     * The effect applies the color matrix directly to the input, and doesn't premultiply the output.
     * @type {Integer (Int32)}
     */
    static D2D1_COLORMATRIX_ALPHA_MODE_STRAIGHT => 2
}
