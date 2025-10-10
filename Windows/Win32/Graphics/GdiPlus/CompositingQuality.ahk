#Requires AutoHotkey v2.0.0 64-bit

/**
 * The CompositingQuality enumeration specifies whether gamma correction is applied when colors are blended with background colors.
 * @remarks
 * 
  * When you specify that gamma correction should not be applied, the image data to be rendered (blended with the background) is assumed to be in a linear color space with a gamma value of 1.0. As a result, no gamma adjustment is applied to the image data before or after blending the image with the background.
  * 
  * When you specify that gamma correction should be applied, the image data to be rendered (blended with the background) is assumed to be in the sRGB color space with a gamma value of 2.2. To ensure accurate blending, the input image data is transformed into a linear (gamma = 1.0) space before the colors are blended and transformed back into sRGB (gamma = 2.2) space afterward. This mode results in a more accurate blend at the expense of additional processing time.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-compositingquality
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class CompositingQuality{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CompositingQualityInvalid => -1

    /**
     * Specifies that gamma correction is not applied.
     * @type {Integer (Int32)}
     */
    static CompositingQualityDefault => 0

    /**
     * Specifies that gamma correction is not applied.
     * @type {Integer (Int32)}
     */
    static CompositingQualityHighSpeed => 1

    /**
     * Specifies that gamma correction is applied.
     * @type {Integer (Int32)}
     */
    static CompositingQualityHighQuality => 2

    /**
     * Specifies that gamma correction is applied.
     * @type {Integer (Int32)}
     */
    static CompositingQualityGammaCorrected => 3

    /**
     * Specifies that gamma correction is not applied.
     * @type {Integer (Int32)}
     */
    static CompositingQualityAssumeLinear => 4
}
