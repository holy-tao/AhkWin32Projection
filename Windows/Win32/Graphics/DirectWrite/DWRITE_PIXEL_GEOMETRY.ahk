#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents the internal structure of a device pixel (that is, the physical arrangement of red, green, and blue color components) that is assumed for purposes of rendering text.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_pixel_geometry
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_PIXEL_GEOMETRY extends Win32Enum {

    /**
     * The red, green, and blue color components of each pixel are assumed to occupy the same point.
     * Native name: DWRITE_PIXEL_GEOMETRY_FLAT
     * @type {Integer (Int32)}
     */
    static FLAT => 0

    /**
     * Each pixel is composed of three vertical stripes, with red on the left, green in the center, and 
     *      blue on the right. This is the most common pixel geometry for LCD monitors.
     * Native name: DWRITE_PIXEL_GEOMETRY_RGB
     * @type {Integer (Int32)}
     */
    static RGB => 1

    /**
     * Each pixel is composed of three vertical stripes, with blue on the left, green in the center, and 
     * 	  red on the right.
     * Native name: DWRITE_PIXEL_GEOMETRY_BGR
     * @type {Integer (Int32)}
     */
    static BGR => 2
}
