#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for properties of the Bitmap source effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_bitmapsource_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_BITMAPSOURCE_PROP{

    /**
     * The IWICBitmapSource containing the image data to be loaded.
 *             
 * 
 * The type is IWICBitmapSource.
 * 
 * The default value is NULL.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAPSOURCE_PROP_WIC_BITMAP_SOURCE => 0

    /**
     * The scale amount in the X and Y direction. The effect multiplies the width by the X value and the height by the Y value. 
 *           This property is a D2D1_VECTOR_2F defined as: (X scale, Y scale). The scale amounts are FLOAT, unitless, and must be positive or 0.
 *           
 * 
 * The type is D2D1_VECTOR_2F.
 * 
 * The default value is {1.0f, 1.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAPSOURCE_PROP_SCALE => 1

    /**
     * The interpolation mode used to scale the image.
 *           If the mode disables the mipmap, then BitmapSouce will cache the image at the resolution determined by the Scale and EnableDPICorrection properties.
 *           
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_bitmapsource_interpolation_mode">D2D1_BITMAPSOURCE_INTERPOLATION_MODE</a>.
 * 
 * The default value is D2D1_BITMAPSOURCE_INTERPOLATION_MODE_LINEAR.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAPSOURCE_PROP_INTERPOLATION_MODE => 2

    /**
     * If you set this to TRUE, the effect will scale the input image to convert the DPI reported by IWICBitmapSource to the DPI of the device context. 
 *           The effect uses the interpolation mode you set with the InterpolationMode property. If you set this to FALSE, the effect uses a DPI of 96.0 for the output image.
 *           
 * 
 * The type is BOOL.
 * 
 * The default value is FALSE.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAPSOURCE_PROP_ENABLE_DPI_CORRECTION => 3

    /**
     * The alpha mode of the output. This can be either premultiplied or straight.
 *           
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_bitmapsource_alpha_mode">D2D1_BITMAPSOURCE_ALPHA_MODE</a>.
 * 
 * The default value is D2D1_BITMAPSOURCE_ALPHA_MODE_PREMULTIPLIED.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAPSOURCE_PROP_ALPHA_MODE => 4

    /**
     * A flip and/or rotation operation to be performed on the image.
 *           
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_bitmapsource_orientation">D2D1_BITMAPSOURCE_ORIENTATION</a>.
 * 
 * The default value is D2D1_BITMAPSOURCE_ORIENTATION_DEFAULT.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAPSOURCE_PROP_ORIENTATION => 5
}
