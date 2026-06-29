#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates how the Color management effect should interpret alpha data that is contained in the input image.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_colormanagement_alpha_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_COLORMANAGEMENT_ALPHA_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The effect assumes the alpha mode is premultiplied.
     * @type {Integer (Int32)}
     */
    static D2D1_COLORMANAGEMENT_ALPHA_MODE_PREMULTIPLIED => 1

    /**
     * The effect assumes the alpha mode is straight.
     * @type {Integer (Int32)}
     */
    static D2D1_COLORMANAGEMENT_ALPHA_MODE_STRAIGHT => 2
}
