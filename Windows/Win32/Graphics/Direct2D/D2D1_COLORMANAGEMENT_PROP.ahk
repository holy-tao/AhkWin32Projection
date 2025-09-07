#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for the properties of the Color management effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_colormanagement_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_COLORMANAGEMENT_PROP{

    /**
     * The source color space information. 
 *           
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1colorcontext">ID2D1ColorContext</a>.
 * 
 * The default value is NULL.
     * @type {Integer (Int32)}
     */
    static D2D1_COLORMANAGEMENT_PROP_SOURCE_COLOR_CONTEXT => 0

    /**
     * Which ICC rendering intent to use. 
 *           
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_colormanagement_rendering_intent">D2D1_COLORMANAGEMENT_RENDERING_INTENT</a>.
 * 
 * The default value is D2D1_COLORMANAGEMENT_RENDERING_INTENT_PERCEPTUAL.
     * @type {Integer (Int32)}
     */
    static D2D1_COLORMANAGEMENT_PROP_SOURCE_RENDERING_INTENT => 1

    /**
     * The destination color space information. 
 *           
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1colorcontext">ID2D1ColorContext</a>.
 * 
 * The default value is NULL.
     * @type {Integer (Int32)}
     */
    static D2D1_COLORMANAGEMENT_PROP_DESTINATION_COLOR_CONTEXT => 2

    /**
     * Which ICC rendering intent to use. 
 *           
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_colormanagement_rendering_intent">D2D1_COLORMANAGEMENT_RENDERING_INTENT</a>.
 * 
 * The default value is D2D1_COLORMANAGEMENT_RENDERING_INTENT_PERCEPTUAL.
     * @type {Integer (Int32)}
     */
    static D2D1_COLORMANAGEMENT_PROP_DESTINATION_RENDERING_INTENT => 3

    /**
     * How to interpret alpha data that is contained in the input image. 
 *           
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_colormanagement_alpha_mode">D2D1_COLORMANAGEMENT_ALPHA_MODE</a>.
 * 
 * The default value is D2D1_COLORMANAGEMENT_ALPHA_MODE_PREMULTIPLIED.
     * @type {Integer (Int32)}
     */
    static D2D1_COLORMANAGEMENT_PROP_ALPHA_MODE => 4

    /**
     * The quality level of the transform. 
 *           
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_colormanagement_quality">D2D1_COLORMANAGEMENT_QUALITY</a>.
 * 
 * The default value is D2D1_COLORMANAGEMENT_QUALITY_NORMAL.
     * @type {Integer (Int32)}
     */
    static D2D1_COLORMANAGEMENT_PROP_QUALITY => 5
}
