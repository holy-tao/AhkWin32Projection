#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Values for the D2D1_RGBTOHUE_PROP_OUTPUT_COLOR_SPACE property of the RGB to Hue effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects_2/ne-d2d1effects_2-d2d1_rgbtohue_output_color_space
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_RGBTOHUE_OUTPUT_COLOR_SPACE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
