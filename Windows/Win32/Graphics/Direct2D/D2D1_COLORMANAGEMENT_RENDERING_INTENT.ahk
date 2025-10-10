#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies which ICC rendering intent the Color management effect should use.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects/ne-d2d1effects-d2d1_colormanagement_rendering_intent
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_COLORMANAGEMENT_RENDERING_INTENT{

    /**
     * The effect compresses or expands the full color gamut of the image to fill the color gamut of the device, 
 *           so that gray balance is preserved but colorimetric accuracy may not be preserved.
     * @type {Integer (Int32)}
     */
    static D2D1_COLORMANAGEMENT_RENDERING_INTENT_PERCEPTUAL => 0

    /**
     * The effect preserves the chroma of colors in the image at the possible expense of hue and lightness.
     * @type {Integer (Int32)}
     */
    static D2D1_COLORMANAGEMENT_RENDERING_INTENT_RELATIVE_COLORIMETRIC => 1

    /**
     * The effect adjusts colors that fall outside the range of colors the output device renders to the closest color available. It does not preserve the white point.
     * @type {Integer (Int32)}
     */
    static D2D1_COLORMANAGEMENT_RENDERING_INTENT_SATURATION => 2

    /**
     * The effect adjusts any colors that fall outside the range that the output device can render to the closest color that can be rendered. The effect does not change the other colors and preserves the white point.
     * @type {Integer (Int32)}
     */
    static D2D1_COLORMANAGEMENT_RENDERING_INTENT_ABSOLUTE_COLORIMETRIC => 3
}
