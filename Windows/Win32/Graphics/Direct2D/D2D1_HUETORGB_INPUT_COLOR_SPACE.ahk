#Requires AutoHotkey v2.0.0 64-bit

/**
 * Values for the D2D1_HUETORGB_PROP_INPUT_COLOR_SPACE property of the Hue to RGB effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects_2/ne-d2d1effects_2-d2d1_huetorgb_input_color_space
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_HUETORGB_INPUT_COLOR_SPACE{

    /**
     * The effect converts from Hue Saturation Value (HSV) to RGB.
     * @type {Integer (Int32)}
     */
    static D2D1_HUETORGB_INPUT_COLOR_SPACE_HUE_SATURATION_VALUE => 0

    /**
     * The effect converts from Hue Saturation Lightness (HSL) to RGB.
     * @type {Integer (Int32)}
     */
    static D2D1_HUETORGB_INPUT_COLOR_SPACE_HUE_SATURATION_LIGHTNESS => 1
}
