#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the alpha mode of the output of the Bitmap source effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects/ne-d2d1effects-d2d1_bitmapsource_alpha_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_BITMAPSOURCE_ALPHA_MODE{

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
