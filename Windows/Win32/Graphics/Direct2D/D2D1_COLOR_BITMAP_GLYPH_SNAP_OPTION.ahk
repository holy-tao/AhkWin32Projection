#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the pixel snapping policy when rendering color bitmap glyphs.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/ne-d2d1_3-d2d1_color_bitmap_glyph_snap_option
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_COLOR_BITMAP_GLYPH_SNAP_OPTION extends Win32Enum{

    /**
     * Color bitmap glyph positions are snapped to the nearest pixel if the bitmap
     *           resolution matches that of the device context.
     * @type {Integer (Int32)}
     */
    static D2D1_COLOR_BITMAP_GLYPH_SNAP_OPTION_DEFAULT => 0

    /**
     * Color bitmap glyph positions are not snapped.
     * @type {Integer (Int32)}
     */
    static D2D1_COLOR_BITMAP_GLYPH_SNAP_OPTION_DISABLE => 1
}
