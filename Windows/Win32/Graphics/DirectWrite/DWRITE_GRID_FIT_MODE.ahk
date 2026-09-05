#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether to enable grid-fitting of glyph outlines (also known as hinting).
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/ne-dwrite_2-dwrite_grid_fit_mode
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
class DWRITE_GRID_FIT_MODE extends Win32Enum {

    /**
     * Choose grid fitting based on the font's table information.
     * Native name: DWRITE_GRID_FIT_MODE_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Always disable grid fitting, using the ideal glyph outlines.
     * Native name: DWRITE_GRID_FIT_MODE_DISABLED
     * @type {Integer (Int32)}
     */
    static DISABLED => 1

    /**
     * Enable grid fitting, adjusting glyph outlines for device pixel display.
     * Native name: DWRITE_GRID_FIT_MODE_ENABLED
     * @type {Integer (Int32)}
     */
    static ENABLED => 2
}
