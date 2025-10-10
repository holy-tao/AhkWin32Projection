#Requires AutoHotkey v2.0.0 64-bit

/**
 * The alpha mode of the output of the Color matrix effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects/ne-d2d1effects-d2d1_colormatrix_alpha_mode
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 * @version v4.0.30319
 */
class D2D1_COLORMATRIX_ALPHA_MODE{

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
