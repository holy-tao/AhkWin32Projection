#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Values for the D2D1_HIGHLIGHTSANDSHADOWS_PROP_INPUT_GAMMA property of the Highlights and Shadows effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects_2/ne-d2d1effects_2-d2d1_highlightsandshadows_input_gamma
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_HIGHLIGHTSANDSHADOWS_INPUT_GAMMA {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates the input image is in linear gamma space.
     * @type {Integer (Int32)}
     */
    static D2D1_HIGHLIGHTSANDSHADOWS_INPUT_GAMMA_LINEAR => 0

    /**
     * Indicates the input image is sRGB gamma space.
     * @type {Integer (Int32)}
     */
    static D2D1_HIGHLIGHTSANDSHADOWS_INPUT_GAMMA_SRGB => 1
}
