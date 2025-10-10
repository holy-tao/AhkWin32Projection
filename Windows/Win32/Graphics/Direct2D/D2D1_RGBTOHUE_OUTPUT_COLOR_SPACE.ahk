#Requires AutoHotkey v2.0.0 64-bit

/**
 * Values for the D2D1_RGBTOHUE_PROP_OUTPUT_COLOR_SPACE property of the RGB to Hue effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects_2/ne-d2d1effects_2-d2d1_rgbtohue_output_color_space
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_RGBTOHUE_OUTPUT_COLOR_SPACE{

    /**
     * The effect converts from RGB to Hue Saturation Value (HSV).
     * @type {Integer (Int32)}
     */
    static D2D1_RGBTOHUE_OUTPUT_COLOR_SPACE_HUE_SATURATION_VALUE => 0

    /**
     * The effect converts from RGB to Hue Saturation Lightness (HSL).
     * @type {Integer (Int32)}
     */
    static D2D1_RGBTOHUE_OUTPUT_COLOR_SPACE_HUE_SATURATION_LIGHTNESS => 1
}
