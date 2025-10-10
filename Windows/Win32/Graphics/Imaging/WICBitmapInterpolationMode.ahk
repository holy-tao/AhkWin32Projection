#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the sampling or filtering mode to use when scaling an image.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicbitmapinterpolationmode
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICBitmapInterpolationMode{

    /**
     * A nearest neighbor interpolation algorithm. Also known as nearest pixel or point interpolation.
 *             
 * 
 * The output pixel is assigned the value of the pixel that the point falls within. No other pixels are considered.
     * @type {Integer (Int32)}
     */
    static WICBitmapInterpolationModeNearestNeighbor => 0

    /**
     * A bilinear interpolation algorithm.
 *             
 * 
 * The output pixel values are computed as a weighted average of the nearest four pixels in a 2x2 grid.
     * @type {Integer (Int32)}
     */
    static WICBitmapInterpolationModeLinear => 1

    /**
     * A bicubic interpolation algorithm.
 *             
 * 
 * Destination pixel values are computed as a weighted average of the nearest sixteen pixels in a 4x4 grid.
     * @type {Integer (Int32)}
     */
    static WICBitmapInterpolationModeCubic => 2

    /**
     * A Fant resampling algorithm.
 *             
 * 
 * Destination pixel values are computed as a weighted average of the all the pixels that map to the new pixel.
     * @type {Integer (Int32)}
     */
    static WICBitmapInterpolationModeFant => 3

    /**
     * A high quality bicubic interpolation algorithm. Destination pixel values are computed using a much denser sampling 
 *       kernel than regular cubic. The kernel is resized in response to the scale factor, making it suitable for downscaling by factors greater than 2.
 * 
 * <div class="alert"><b>Note</b>  This value is supported beginning with Windows 10.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WICBitmapInterpolationModeHighQualityCubic => 4
}
