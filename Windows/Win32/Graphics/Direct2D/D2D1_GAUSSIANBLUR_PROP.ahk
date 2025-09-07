#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for properties of the Gaussian blur effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_gaussianblur_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_GAUSSIANBLUR_PROP{

    /**
     * The amount of blur to be applied to the image. You can compute the blur radius of the kernel by multiplying the standard deviation by 3.
 *             The units of both the standard deviation and blur radius are DIPs. A value of zero DIPs disables this effect entirely.
 *             
 * 
 * The type is FLOAT.
 * 
 * The default value is 3.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_GAUSSIANBLUR_PROP_STANDARD_DEVIATION => 0

    /**
     * The optimization mode.
 *             
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_gaussianblur_optimization">D2D1_GAUSSIANBLUR_OPTIMIZATION</a>.
 * 
 * The default value is D2D1_GAUSSIANBLUR_OPTIMIZATION_BALANCED.
     * @type {Integer (Int32)}
     */
    static D2D1_GAUSSIANBLUR_PROP_OPTIMIZATION => 1

    /**
     * The mode used to calculate the border of the image, soft or hard.
 *             
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_gaussianblur_optimization">D2D1_GAUSSIANBLUR_OPTIMIZATION</a>.
 * 
 * The default value is D2D1_BORDER_MODE_SOFT.
     * @type {Integer (Int32)}
     */
    static D2D1_GAUSSIANBLUR_PROP_BORDER_MODE => 2
}
