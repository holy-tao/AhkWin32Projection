#Requires AutoHotkey v2.0.0 64-bit

/**
 * The PixelOffsetMode enumeration specifies the pixel offset mode of a Graphics object. This enumeration is used by the Graphics::GetPixelOffsetMode and Graphics::SetPixelOffsetMode methods of the Graphics class.
 * @remarks
 * 
 * Consider the pixel in the upper-left corner of an image with address (0, 0). With <b><b>PixelOffsetModeNone</b></b>, the pixel covers the area between 
 * 				–0.5 and 0.5 in both the x and y directions; that is, the pixel center is at (0, 0). With <b><b>PixelOffsetModeHalf</b></b>, the pixel covers the area between 0 and 1 in both the x and y directions; that is, the pixel center is at (0.5, 0.5).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-pixeloffsetmode
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class PixelOffsetMode{

    /**
     * Used internally.
     * @type {Integer (Int32)}
     */
    static PixelOffsetModeInvalid => -1

    /**
     * Equivalent to PixelOffsetModeNone.
     * @type {Integer (Int32)}
     */
    static PixelOffsetModeDefault => 0

    /**
     * Equivalent to PixelOffsetModeNone.
     * @type {Integer (Int32)}
     */
    static PixelOffsetModeHighSpeed => 1

    /**
     * Equivalent to PixelOffsetModeHalf.
     * @type {Integer (Int32)}
     */
    static PixelOffsetModeHighQuality => 2

    /**
     * Indicates that pixel centers have integer coordinates.
     * @type {Integer (Int32)}
     */
    static PixelOffsetModeNone => 3

    /**
     * Indicates that pixel centers have coordinates that are half way between integer values.
     * @type {Integer (Int32)}
     */
    static PixelOffsetModeHalf => 4
}
