#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the logical screen descriptor properties for Graphics Interchange Format (GIF) metadata.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicgiflogicalscreendescriptorproperties
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICGifLogicalScreenDescriptorProperties extends Win32Enum{

    /**
     * [VT_UI1 | VT_VECTOR] Indicates the signature property.
     * @type {Integer (Int32)}
     */
    static WICGifLogicalScreenSignature => 1

    /**
     * [VT_UI2] Indicates the width in pixels.
     * @type {Integer (Int32)}
     */
    static WICGifLogicalScreenDescriptorWidth => 2

    /**
     * [VT_UI2] Indicates the height in pixels.
     * @type {Integer (Int32)}
     */
    static WICGifLogicalScreenDescriptorHeight => 3

    /**
     * [VT_BOOL] Indicates the  global color table flag. <b>TRUE</b> if a global color table is present; otherwise, <b>FALSE</b>.
     * @type {Integer (Int32)}
     */
    static WICGifLogicalScreenDescriptorGlobalColorTableFlag => 4

    /**
     * [VT_UI1] Indicates the color resolution in bits per pixel.
     * @type {Integer (Int32)}
     */
    static WICGifLogicalScreenDescriptorColorResolution => 5

    /**
     * [VT_BOOL] Indicates the sorted color table flag. <b>TRUE</b> if the table is sorted; otherwise, <b>FALSE</b>.
     * @type {Integer (Int32)}
     */
    static WICGifLogicalScreenDescriptorSortFlag => 6

    /**
     * [VT_UI1] Indicates the value used to calculate the number of bytes contained in the global color table. 
     * 
     * To calculate the actual size of the color table, raise 2 to the value of the field + 1.
     * @type {Integer (Int32)}
     */
    static WICGifLogicalScreenDescriptorGlobalColorTableSize => 7

    /**
     * [VT_UI1] Indicates the index within the color table to use for the background (pixels not defined in the image).
     * @type {Integer (Int32)}
     */
    static WICGifLogicalScreenDescriptorBackgroundColorIndex => 8

    /**
     * [VT_UI1] Indicates the factor used to compute an approximation of the aspect ratio.
     * @type {Integer (Int32)}
     */
    static WICGifLogicalScreenDescriptorPixelAspectRatio => 9
}
