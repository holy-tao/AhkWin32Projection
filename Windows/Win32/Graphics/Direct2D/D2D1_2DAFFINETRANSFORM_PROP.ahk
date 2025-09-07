#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for properties of the 2D affine transform effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_2daffinetransform_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_2DAFFINETRANSFORM_PROP{

    /**
     * The interpolation mode used to scale the image. There are 6 scale modes that range in quality and speed.
 *             
 * 
 * Type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_2daffinetransform_interpolation_mode">D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE</a>.
 * 
 * Default value is D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE_LINEAR.
     * @type {Integer (Int32)}
     */
    static D2D1_2DAFFINETRANSFORM_PROP_INTERPOLATION_MODE => 0

    /**
     * The mode used to calculate the border of the image, soft or hard.
 *             
 * 
 * Type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_border_mode">D2D1_BORDER_MODE</a>.
 * 
 * Default value is D2D1_BORDER_MODE_SOFT.
     * @type {Integer (Int32)}
     */
    static D2D1_2DAFFINETRANSFORM_PROP_BORDER_MODE => 1

    /**
     * The 3x2 matrix to transform the image using the Direct2D matrix transform.
 *             
 * 
 * Type is <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>.
 * 
 * Default value is Matrix3x2F::Identity().
     * @type {Integer (Int32)}
     */
    static D2D1_2DAFFINETRANSFORM_PROP_TRANSFORM_MATRIX => 2

    /**
     * In the high quality cubic interpolation mode, the sharpness level of the scaling filter as a float between 0 and 1. The values are unitless. You can use sharpness to adjust the quality of an image when you scale the image.
 *             The sharpness factor affects the shape of the kernel. The higher the sharpness factor, the smaller the kernel.
 *             
 * 
 * <div class="alert"><b>Note</b>  This property affects only the high quality cubic interpolation mode.</div>
 * <div> </div>
 * Type is FLOAT.
 * 
 * Default value is 1.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_2DAFFINETRANSFORM_PROP_SHARPNESS => 3
}
