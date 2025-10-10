#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the image descriptor metadata properties for Graphics Interchange Format (GIF) frames.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicgifimagedescriptorproperties
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICGifImageDescriptorProperties{

    /**
     * [VT_UI2] Indicates the X offset at which to locate this frame within the logical screen.
     * @type {Integer (Int32)}
     */
    static WICGifImageDescriptorLeft => 1

    /**
     * [VT_UI2] Indicates the Y offset at which to locate this frame within the logical screen.
     * @type {Integer (Int32)}
     */
    static WICGifImageDescriptorTop => 2

    /**
     * [VT_UI2] Indicates width of this frame, in pixels.
     * @type {Integer (Int32)}
     */
    static WICGifImageDescriptorWidth => 3

    /**
     * [VT_UI2] Indicates height of this frame, in pixels.
     * @type {Integer (Int32)}
     */
    static WICGifImageDescriptorHeight => 4

    /**
     * [VT_BOOL] Indicates the local color table flag. <b>TRUE</b> if global color table is present; otherwise, <b>FALSE</b>.
     * @type {Integer (Int32)}
     */
    static WICGifImageDescriptorLocalColorTableFlag => 5

    /**
     * [VT_BOOL] Indicates the interlace flag. <b>TRUE</b> if image is interlaced; otherwise, <b>FALSE</b>.
     * @type {Integer (Int32)}
     */
    static WICGifImageDescriptorInterlaceFlag => 6

    /**
     * [VT_BOOL] Indicates the sorted color table flag. <b>TRUE</b> if the color table is sorted from most frequently to least frequently used color; otherwise, <b>FALSE</b>.
     * @type {Integer (Int32)}
     */
    static WICGifImageDescriptorSortFlag => 7

    /**
     * [VT_UI1] Indicates the value used to calculate the number of bytes contained in the global color table. 
 * 
 * To calculate the actual size of the color table, raise 2 to the value of the field + 1.
     * @type {Integer (Int32)}
     */
    static WICGifImageDescriptorLocalColorTableSize => 8
}
