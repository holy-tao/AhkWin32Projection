#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the algorithm that is used when images are scaled or rotated.
 * @remarks
 * To stretch an image, each pixel in the original image must be mapped to a group of pixels in the larger image. To shrink an image, groups of pixels in the original image must be mapped to single pixels in the smaller image. The effectiveness of the algorithms that perform these mappings determines the quality of a scaled image. Algorithms that produce higher-quality scaled images tend to require more processing time. <b>D2D1_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR</b> provides faster but lower-quality interpolation, while <b>D2D1_BITMAP_INTERPOLATION_MODE_LINEAR</b> provides higher-quality interpolation.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_bitmap_interpolation_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_BITMAP_INTERPOLATION_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use the exact color of the nearest bitmap pixel to the current rendering pixel.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR => 0

    /**
     * Interpolate a color from the four bitmap pixels that are the nearest to the rendering pixel.
     * @type {Integer (Int32)}
     */
    static D2D1_BITMAP_INTERPOLATION_MODE_LINEAR => 1
}
