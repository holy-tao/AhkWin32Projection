#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for properties of the Convolve matrix effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_convolvematrix_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_CONVOLVEMATRIX_PROP{

    /**
     * The size of one unit in the kernel. The units are in (DIPs/kernel unit), where a kernel unit is the size of the element in the convolution kernel. 
 *           A value of 1 (DIP/kernel unit) corresponds to one pixel in a image at 96 DPI.
 *           
 * 
 * The type is FLOAT.
 * 
 * The default value is 1.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_CONVOLVEMATRIX_PROP_KERNEL_UNIT_LENGTH => 0

    /**
     * The interpolation mode the effect uses to scale the image to the corresponding kernel unit length. There are six scale modes that range in quality and speed.
 *           
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_convolvematrix_scale_mode">D2D1_CONVOLVEMATRIX_SCALE_MODE</a>.
 * 
 * The default value is D2D1_CONVOLVEMATRIX_SCALE_MODE_LINEAR.
     * @type {Integer (Int32)}
     */
    static D2D1_CONVOLVEMATRIX_PROP_SCALE_MODE => 1

    /**
     * The width of the kernel matrix. The units are specified in kernel units. 
 *           
 * 
 * The type is UINT32.
 * 
 * The default value is 3.
     * @type {Integer (Int32)}
     */
    static D2D1_CONVOLVEMATRIX_PROP_KERNEL_SIZE_X => 2

    /**
     * The height of the kernel matrix. The units are specified in kernel units. 
 *           
 * 
 * The type is UINT32.
 * 
 * The default value is 3.
     * @type {Integer (Int32)}
     */
    static D2D1_CONVOLVEMATRIX_PROP_KERNEL_SIZE_Y => 3

    /**
     * The kernel matrix to be applied to the image. The kernel elements aren't bounded and are specified as floats.
 *           
 * 
 * The first set of KernelSizeX numbers in the FLOAT[] corresponds to the first row in the kernel.
 *           The second set of KernelSizeX numbers correspond to the second row, and so on up to KernelSizeY rows.
 * 
 * The type is FLOAT[].
 * 
 * The default value is {0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_CONVOLVEMATRIX_PROP_KERNEL_MATRIX => 4

    /**
     * The kernel matrix is applied to a pixel and then the result is divided by this value. 
 *           
 * 
 * 0 behaves as a value of float epsilon.
 * 
 * The type is FLOAT.
 * 
 * The default value is 1.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_CONVOLVEMATRIX_PROP_DIVISOR => 5

    /**
     * The effect applies the kernel matrix, the divisor, and then the bias is added to the result. The bias is unbounded and unitless. 
 *           
 * 
 * The type is FLOAT.
 * 
 * The default value is 0.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_CONVOLVEMATRIX_PROP_BIAS => 6

    /**
     * Shifts the convolution kernel from a centered position on the output pixel to a position you specify left/right and up/down. The offset is defined in kernel units.
 *           
 * 
 * With some offsets and kernel sizes, the convolution kernel’s samples won't land on a pixel image center. The pixel values for the kernel sample are computed by bilinear interpolation.
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_2f">D2D1_VECTOR_2F</a>.
 * 
 * The default value is {0.0f, 0.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_CONVOLVEMATRIX_PROP_KERNEL_OFFSET => 7

    /**
     * Specifies whether the convolution kernel is applied to the alpha channel or only the color channels.
 *           
 * 
 * If you set this to TRUE the convolution kernel is applied only to the color channels.
 * 
 * If you set this to FALSE the convolution kernel is applied to all channels.
 * 
 * The type is BOOL.
 * 
 * The default value is FALSE.
     * @type {Integer (Int32)}
     */
    static D2D1_CONVOLVEMATRIX_PROP_PRESERVE_ALPHA => 8

    /**
     * The mode used to calculate the border of the image, soft or hard.
 *           
 * 
 * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_border_mode">D2D1_BORDER_MODE</a>.
 * 
 * The default value is D2D1_BORDER_MODE_SOFT.
     * @type {Integer (Int32)}
     */
    static D2D1_CONVOLVEMATRIX_PROP_BORDER_MODE => 9

    /**
     * Whether the effect clamps color values to between 0 and 1 before the effect passes the values to the next effect in the graph. The effect clamps the values before it premultiplies the alpha.
 *           
 * 
 * If you set this to TRUE the effect will clamp the values. If you set this to FALSE, the effect will not clamp the color values, 
 *           but other effects and the output surface may clamp the values if they are not of high enough precision.
 * 
 * The type is BOOL.
 * 
 * The default value is FALSE.
     * @type {Integer (Int32)}
     */
    static D2D1_CONVOLVEMATRIX_PROP_CLAMP_OUTPUT => 10
}
