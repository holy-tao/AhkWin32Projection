#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ColorAdjustType enumeration specifies which GDI+ objects use color-adjustment information.
 * @see https://docs.microsoft.com/windows/win32/api//gdipluscolormatrix/ne-gdipluscolormatrix-coloradjusttype
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ColorAdjustType{

    /**
     * Specifies that color or grayscale adjustment applies to all categories that do not have adjustment settings of their own.
     * @type {Integer (Int32)}
     */
    static ColorAdjustTypeDefault => 0

    /**
     * Specifies that color or grayscale adjustment applies to bitmapped images.
     * @type {Integer (Int32)}
     */
    static ColorAdjustTypeBitmap => 1

    /**
     * Specifies that color or grayscale adjustment applies to brush operations in metafiles.
     * @type {Integer (Int32)}
     */
    static ColorAdjustTypeBrush => 2

    /**
     * Specifies that color or grayscale adjustment applies to pen operations in metafiles.
     * @type {Integer (Int32)}
     */
    static ColorAdjustTypePen => 3

    /**
     * Specifies that color or grayscale adjustment applies to text drawn in metafiles.
     * @type {Integer (Int32)}
     */
    static ColorAdjustTypeText => 4

    /**
     * Used internally to record the number of color adjustment types.
     * @type {Integer (Int32)}
     */
    static ColorAdjustTypeCount => 5

    /**
     * Reserved
     * @type {Integer (Int32)}
     */
    static ColorAdjustTypeAny => 6
}
