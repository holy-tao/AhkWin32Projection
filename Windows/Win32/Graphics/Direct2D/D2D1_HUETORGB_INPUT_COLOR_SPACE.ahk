#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Values for the D2D1_HUETORGB_PROP_INPUT_COLOR_SPACE property of the Hue to RGB effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects_2/ne-d2d1effects_2-d2d1_huetorgb_input_color_space
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_HUETORGB_INPUT_COLOR_SPACE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
