#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ColorMatrixFlags enumeration specifies the types of images and colors that will be affected by the color and grayscale adjustment settings of an ImageAttributes object.
 * @see https://docs.microsoft.com/windows/win32/api//gdipluscolormatrix/ne-gdipluscolormatrix-colormatrixflags
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ColorMatrixFlags{

    /**
     * Specifies that all color values (including grays) are adjusted by the same color-adjustment matrix.
     * @type {Integer (Int32)}
     */
    static ColorMatrixFlagsDefault => 0

    /**
     * Specifies that colors are adjusted but gray shades are not adjusted. A gray shade is any color that has the same value for its red, green, and blue components.
     * @type {Integer (Int32)}
     */
    static ColorMatrixFlagsSkipGrays => 1

    /**
     * Specifies that colors are adjusted by one matrix and gray shades are adjusted by another matrix.
     * @type {Integer (Int32)}
     */
    static ColorMatrixFlagsAltGray => 2
}
