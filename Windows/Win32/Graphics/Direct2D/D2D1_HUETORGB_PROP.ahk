#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifiers for properties of the Hue to RGB effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects_2/ne-d2d1effects_2-d2d1_huetorgb_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_HUETORGB_PROP {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The D2D1_HUETORGB_PROP_INPUT_COLOR_SPACE property is an enumeration value which indicates which color space to convert from. 
     *           The default value for the property is D2D1_HUETORGB_INPUT_COLOR_SPACE_HUE_SATURATION_VALUE.
     *           See <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects_2/ne-d2d1effects_2-d2d1_huetorgb_input_color_space">D2D1_HUETORGB_INPUT_COLOR_SPACE</a> enumeration for more information.
     * @type {Integer (Int32)}
     */
    static D2D1_HUETORGB_PROP_INPUT_COLOR_SPACE => 0
}
