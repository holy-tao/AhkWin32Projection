#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifiers for properties of the DPI compensation effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_dpicompensation_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_DPICOMPENSATION_PROP {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The interpolation mode the effect uses to scale the image.
     *             
     * 
     * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_dpicompensation_interpolation_mode">D2D1_DPICOMPENSATION_INTERPOLATION_MODE</a>.
     * 
     * The default value is D2D1_DPICOMPENSATION_INTERPOLATION_MODE_LINEAR.
     * @type {Integer (Int32)}
     */
    static D2D1_DPICOMPENSATION_PROP_INTERPOLATION_MODE => 0

    /**
     * The mode used to calculate the border of the image, soft or hard. See Border modes for more info.
     *             
     * 
     * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_border_mode">D2D1_BORDER_MODE</a>.
     * 
     * The default value is D2D1_BORDER_MODE_SOFT.
     * @type {Integer (Int32)}
     */
    static D2D1_DPICOMPENSATION_PROP_BORDER_MODE => 1

    /**
     * The DPI of the input image.
     *             
     * 
     * The type is FLOAT.
     * 
     * The default value is 96.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_DPICOMPENSATION_PROP_INPUT_DPI => 2
}
