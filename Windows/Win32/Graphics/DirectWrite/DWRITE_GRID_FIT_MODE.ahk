#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether to enable grid-fitting of glyph outlines (also known as hinting).
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/ne-dwrite_2-dwrite_grid_fit_mode
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_GRID_FIT_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
