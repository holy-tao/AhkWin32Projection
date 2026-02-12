#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the interpolation mode used for scaling pixel data.
 * @remarks
 * This enumeration is used when setting the [InterpolationMode](bitmaptransform_interpolationmode.md) property of a [BitmapTransform](bitmaptransform.md).
 * 
 * In general, moving from **NearestNeighbor** to **Fant**, interpolation quality increases while performance decreases.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapinterpolationmode
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class BitmapInterpolationMode extends Win32Enum{

    /**
     * A nearest neighbor interpolation algorithm. Also known as nearest pixel or point interpolation. The output pixel is assigned the value of the pixel that the point falls within. No other pixels are considered.
     * @type {Integer (Int32)}
     */
    static NearestNeighbor => 0

    /**
     * A bilinear interpolation algorithm. The output pixel values are computed as a weighted average of the nearest four pixels in a 2x2 grid.
     * @type {Integer (Int32)}
     */
    static Linear => 1

    /**
     * A bicubic interpolation algorithm. Destination pixel values are computed as a weighted average of the nearest sixteen pixels in a 4x4 grid.
     * @type {Integer (Int32)}
     */
    static Cubic => 2

    /**
     * A Fant resampling algorithm. Destination pixel values are computed as a weighted average of the all the pixels that map to the new pixel in a box shaped kernel.
     * @type {Integer (Int32)}
     */
    static Fant => 3
}
