#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the internal structure of a device pixel (that is, the physical arrangement of red, green, and blue color components) that is assumed for purposes of rendering text.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_pixel_geometry
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_PIXEL_GEOMETRY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The red, green, and blue color components of each pixel are assumed to occupy the same point.
     * @type {Integer (Int32)}
     */
    static DWRITE_PIXEL_GEOMETRY_FLAT => 0

    /**
     * Each pixel is composed of three vertical stripes, with red on the left, green in the center, and 
     *      blue on the right. This is the most common pixel geometry for LCD monitors.
     * @type {Integer (Int32)}
     */
    static DWRITE_PIXEL_GEOMETRY_RGB => 1

    /**
     * Each pixel is composed of three vertical stripes, with blue on the left, green in the center, and 
     * 	  red on the right.
     * @type {Integer (Int32)}
     */
    static DWRITE_PIXEL_GEOMETRY_BGR => 2
}
