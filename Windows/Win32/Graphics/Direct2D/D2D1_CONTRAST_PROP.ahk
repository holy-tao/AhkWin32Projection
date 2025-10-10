#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for properties of the Contrast effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects_2/ne-d2d1effects_2-d2d1_contrast_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_CONTRAST_PROP{

    /**
     * The D2D1_CONTRAST_PROP_CONTRAST property is a float value indicating the amount by which to adjust the contrast of the image. Negative values reduce contrast, while positive values increase contrast.  
 *           Minimum value is -1.0f, maximum value is 1.0f.  The default value for the property is 0.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_CONTRAST_PROP_CONTRAST => 0

    /**
     * The D2D1_CONTRAST_PROP_CLAMP_INPUT property is a boolean value indicating whether or not to clamp the input to [0.0, 1.0]. The default value for the property is FALSE.
     * @type {Integer (Int32)}
     */
    static D2D1_CONTRAST_PROP_CLAMP_INPUT => 1
}
