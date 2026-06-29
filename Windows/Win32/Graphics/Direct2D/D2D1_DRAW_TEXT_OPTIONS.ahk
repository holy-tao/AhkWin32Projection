#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether text snapping is suppressed or clipping to the layout rectangle is enabled. This enumeration allows a bitwise combination of its member values.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_draw_text_options
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_DRAW_TEXT_OPTIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Text is not vertically snapped to pixel boundaries. This setting is recommended for text that is being animated.
     * @type {Integer (Int32)}
     */
    static D2D1_DRAW_TEXT_OPTIONS_NO_SNAP => 1

    /**
     * Text is clipped to the layout rectangle.
     * @type {Integer (Int32)}
     */
    static D2D1_DRAW_TEXT_OPTIONS_CLIP => 2

    /**
     * In Windows 8.1 and later, text is rendered using color versions of glyphs, if defined by the font.
     * @type {Integer (Int32)}
     */
    static D2D1_DRAW_TEXT_OPTIONS_ENABLE_COLOR_FONT => 4

    /**
     * Bitmap origins of color glyph bitmaps are not snapped.
     * @type {Integer (Int32)}
     */
    static D2D1_DRAW_TEXT_OPTIONS_DISABLE_COLOR_BITMAP_SNAPPING => 8

    /**
     * Text is vertically snapped to pixel boundaries and is not clipped to the layout rectangle.
     * @type {Integer (Int32)}
     */
    static D2D1_DRAW_TEXT_OPTIONS_NONE => 0
}
