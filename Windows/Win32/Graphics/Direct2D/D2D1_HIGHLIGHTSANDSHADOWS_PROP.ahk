#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for properties of the Highlights and Shadows effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects_2/ne-d2d1effects_2-d2d1_highlightsandshadows_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_HIGHLIGHTSANDSHADOWS_PROP{

    /**
     * The D2D1_HIGHLIGHTSANDSHADOWS_PROP_HIGHLIGHTS property is a float value indicating how much to increase or decrease highlights.  The allowed range is -1.0 to 1.0. The default value is 0.0.
     * @type {Integer (Int32)}
     */
    static D2D1_HIGHLIGHTSANDSHADOWS_PROP_HIGHLIGHTS => 0

    /**
     * The D2D1_HIGHLIGHTSANDSHADOWS_PROP_SHADOWS property is a float value indicating how much to increase or decrease shadows.  The allowed range is -1.0 to 1.0. The default value is 0.0.
     * @type {Integer (Int32)}
     */
    static D2D1_HIGHLIGHTSANDSHADOWS_PROP_SHADOWS => 1

    /**
     * The D2D1_HIGHLIGHTSANDSHADOWS_PROP_CLARITY property is a float value indicating how much to increase or decrease clarity.  The allowed range is -1.0 to 1.0. The default value is 0.0.
     * @type {Integer (Int32)}
     */
    static D2D1_HIGHLIGHTSANDSHADOWS_PROP_CLARITY => 2

    /**
     * The D2D1_HIGHLIGHTSANDSHADOWS_PROP_INPUT_GAMMA property is a <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects_2/ne-d2d1effects_2-d2d1_highlightsandshadows_input_gamma">D2D1_HIGHLIGHTSANDSHADOWS_INPUT_GAMMA</a> enumeration value
 *           indicating the gamma of the input image.  The Highlights and Shadows effect works in linear gamma space, so if the input image is know to be linear, the D2D1_HIGHLIGHTSANDSHADOWS_INPUT_GAMMA_LINEAR value should be used to prevent sRGB to linear conversions from being performed.
     * @type {Integer (Int32)}
     */
    static D2D1_HIGHLIGHTSANDSHADOWS_PROP_INPUT_GAMMA => 3

    /**
     * The D2D1_HIGHLIGHTSANDSHADOWS_PROP_MASK_BLUR_RADIUS property is a float value controlling the size of the region used around a pixel to classify the pixel as highlight or shadow. Lower values result in more localized adjustments. 
 *           The allowed range is 0.0 to 10.0.  The default value is 1.25.
     * @type {Integer (Int32)}
     */
    static D2D1_HIGHLIGHTSANDSHADOWS_PROP_MASK_BLUR_RADIUS => 4
}
