#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether to enable grid-fitting of glyph outlines (also known as hinting).
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/ne-dwrite_2-dwrite_grid_fit_mode
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_GRID_FIT_MODE extends Win32Enum{

    /**
     * Choose grid fitting based on the font's table information.
     * @type {Integer (Int32)}
     */
    static DWRITE_GRID_FIT_MODE_DEFAULT => 0

    /**
     * Always disable grid fitting, using the ideal glyph outlines.
     * @type {Integer (Int32)}
     */
    static DWRITE_GRID_FIT_MODE_DISABLED => 1

    /**
     * Enable grid fitting, adjusting glyph outlines for device pixel display.
     * @type {Integer (Int32)}
     */
    static DWRITE_GRID_FIT_MODE_ENABLED => 2
}
