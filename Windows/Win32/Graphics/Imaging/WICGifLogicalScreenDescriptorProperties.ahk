#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the logical screen descriptor properties for Graphics Interchange Format (GIF) metadata.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicgiflogicalscreendescriptorproperties
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICGifLogicalScreenDescriptorProperties extends Win32Enum {

    /**
     * [VT_UI1 | VT_VECTOR] Indicates the signature property.
     * Native name: WICGifLogicalScreenSignature
     * @type {Integer (Int32)}
     */
    static Signature => 1

    /**
     * [VT_UI2] Indicates the width in pixels.
     * Native name: WICGifLogicalScreenDescriptorWidth
     * @type {Integer (Int32)}
     */
    static Width => 2

    /**
     * [VT_UI2] Indicates the height in pixels.
     * Native name: WICGifLogicalScreenDescriptorHeight
     * @type {Integer (Int32)}
     */
    static Height => 3

    /**
     * [VT_BOOL] Indicates the  global color table flag. <b>TRUE</b> if a global color table is present; otherwise, <b>FALSE</b>.
     * Native name: WICGifLogicalScreenDescriptorGlobalColorTableFlag
     * @type {Integer (Int32)}
     */
    static GlobalColorTableFlag => 4

    /**
     * [VT_UI1] Indicates the color resolution in bits per pixel.
     * Native name: WICGifLogicalScreenDescriptorColorResolution
     * @type {Integer (Int32)}
     */
    static ColorResolution => 5

    /**
     * [VT_BOOL] Indicates the sorted color table flag. <b>TRUE</b> if the table is sorted; otherwise, <b>FALSE</b>.
     * Native name: WICGifLogicalScreenDescriptorSortFlag
     * @type {Integer (Int32)}
     */
    static SortFlag => 6

    /**
     * [VT_UI1] Indicates the value used to calculate the number of bytes contained in the global color table. 
     * 
     * To calculate the actual size of the color table, raise 2 to the value of the field + 1.
     * Native name: WICGifLogicalScreenDescriptorGlobalColorTableSize
     * @type {Integer (Int32)}
     */
    static GlobalColorTableSize => 7

    /**
     * [VT_UI1] Indicates the index within the color table to use for the background (pixels not defined in the image).
     * Native name: WICGifLogicalScreenDescriptorBackgroundColorIndex
     * @type {Integer (Int32)}
     */
    static BackgroundColorIndex => 8

    /**
     * [VT_UI1] Indicates the factor used to compute an approximation of the aspect ratio.
     * Native name: WICGifLogicalScreenDescriptorPixelAspectRatio
     * @type {Integer (Int32)}
     */
    static PixelAspectRatio => 9
}
