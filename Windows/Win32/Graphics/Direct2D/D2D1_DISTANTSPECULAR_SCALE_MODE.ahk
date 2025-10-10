#Requires AutoHotkey v2.0.0 64-bit

/**
 * The interpolation mode the Distant-specular lighting effect uses to scale the image to the corresponding kernel unit length. There are six scale modes that range in quality and speed.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects/ne-d2d1effects-d2d1_distantspecular_scale_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_DISTANTSPECULAR_SCALE_MODE{

    /**
     * Samples the nearest single point and uses that. This mode uses less processing time, but outputs the lowest quality image.
     * @type {Integer (Int32)}
     */
    static D2D1_DISTANTSPECULAR_SCALE_MODE_NEAREST_NEIGHBOR => 0

    /**
     * Uses a four point sample and linear interpolation. This mode outputs a higher quality image than nearest neighbor.
     * @type {Integer (Int32)}
     */
    static D2D1_DISTANTSPECULAR_SCALE_MODE_LINEAR => 1

    /**
     * Uses a 16 sample cubic kernel for interpolation. This mode uses the most processing time, but outputs a higher quality image.
     * @type {Integer (Int32)}
     */
    static D2D1_DISTANTSPECULAR_SCALE_MODE_CUBIC => 2

    /**
     * Uses 4 linear samples within a single pixel for good edge anti-aliasing. This mode is good for scaling down by small amounts on images with few pixels.
     * @type {Integer (Int32)}
     */
    static D2D1_DISTANTSPECULAR_SCALE_MODE_MULTI_SAMPLE_LINEAR => 3

    /**
     * Uses anisotropic filtering to sample a pattern according to the transformed shape of the bitmap.
     * @type {Integer (Int32)}
     */
    static D2D1_DISTANTSPECULAR_SCALE_MODE_ANISOTROPIC => 4

    /**
     * Uses a variable size high quality cubic kernel to perform a pre-downscale the image if downscaling is involved in the transform matrix. 
 *           Then uses the cubic interpolation mode for the final output.
     * @type {Integer (Int32)}
     */
    static D2D1_DISTANTSPECULAR_SCALE_MODE_HIGH_QUALITY_CUBIC => 5
}
