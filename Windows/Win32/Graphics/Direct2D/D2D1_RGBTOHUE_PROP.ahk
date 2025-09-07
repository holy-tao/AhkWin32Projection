#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for properties of the RGB to Hue effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects_2/ne-d2d1effects_2-d2d1_rgbtohue_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_RGBTOHUE_PROP{

    /**
     * The D2D1_RGBTOHUE_PROP_OUTPUT_COLOR_SPACE property is an enumeration value which indicates the color space to convert to. 
 *           The default value for the property is D2D1_RGBTOHUE_OUTPUT_COLOR_SPACE_HUE_SATURATION_VALUE.
 *           See the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects_2/ne-d2d1effects_2-d2d1_rgbtohue_output_color_space">D2D1_RGBTOHUE_OUTPUT_COLOR_SPACE</a> enumeration for more information.
     * @type {Integer (Int32)}
     */
    static D2D1_RGBTOHUE_PROP_OUTPUT_COLOR_SPACE => 0
}
