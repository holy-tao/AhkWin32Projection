#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the image descriptor metadata properties for Graphics Interchange Format (GIF) frames.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicgifimagedescriptorproperties
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICGifImageDescriptorProperties extends Win32Enum {

    /**
     * [VT_UI2] Indicates the X offset at which to locate this frame within the logical screen.
     * Native name: WICGifImageDescriptorLeft
     * @type {Integer (Int32)}
     */
    static Left => 1

    /**
     * [VT_UI2] Indicates the Y offset at which to locate this frame within the logical screen.
     * Native name: WICGifImageDescriptorTop
     * @type {Integer (Int32)}
     */
    static Top => 2

    /**
     * [VT_UI2] Indicates width of this frame, in pixels.
     * Native name: WICGifImageDescriptorWidth
     * @type {Integer (Int32)}
     */
    static Width => 3

    /**
     * [VT_UI2] Indicates height of this frame, in pixels.
     * Native name: WICGifImageDescriptorHeight
     * @type {Integer (Int32)}
     */
    static Height => 4

    /**
     * [VT_BOOL] Indicates the local color table flag. <b>TRUE</b> if global color table is present; otherwise, <b>FALSE</b>.
     * Native name: WICGifImageDescriptorLocalColorTableFlag
     * @type {Integer (Int32)}
     */
    static LocalColorTableFlag => 5

    /**
     * [VT_BOOL] Indicates the interlace flag. <b>TRUE</b> if image is interlaced; otherwise, <b>FALSE</b>.
     * Native name: WICGifImageDescriptorInterlaceFlag
     * @type {Integer (Int32)}
     */
    static InterlaceFlag => 6

    /**
     * [VT_BOOL] Indicates the sorted color table flag. <b>TRUE</b> if the color table is sorted from most frequently to least frequently used color; otherwise, <b>FALSE</b>.
     * Native name: WICGifImageDescriptorSortFlag
     * @type {Integer (Int32)}
     */
    static SortFlag => 7

    /**
     * [VT_UI1] Indicates the value used to calculate the number of bytes contained in the global color table. 
     * 
     * To calculate the actual size of the color table, raise 2 to the value of the field + 1.
     * Native name: WICGifImageDescriptorLocalColorTableSize
     * @type {Integer (Int32)}
     */
    static LocalColorTableSize => 8
}
