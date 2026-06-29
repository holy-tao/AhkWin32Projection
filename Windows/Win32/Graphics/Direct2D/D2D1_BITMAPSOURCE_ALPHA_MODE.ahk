#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the alpha mode of the output of the Bitmap source effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_bitmapsource_alpha_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_BITMAPSOURCE_ALPHA_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The effect output uses premultiplied alpha.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAPSOURCE_ALPHA_MODE_PREMULTIPLIED => 1

    /**
     * The effect output uses straight alpha.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAPSOURCE_ALPHA_MODE_STRAIGHT => 2
}
