#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how the IInkD2DRenderer2 object draws ink (standard and modified) when system is in a contrast theme mode.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/inkrenderer/ne-inkrenderer-ink_high_contrast_adjustment
 * @namespace Windows.Win32.UI.Input.Ink
 * @version v4.0.30319
 */
class INK_HIGH_CONTRAST_ADJUSTMENT{

    /**
     * For standard strokes, use selected color if contrast is sufficient against the background. Otherwise, use system color.
 * 
 * For highlighter strokes, use selected color if contrast is sufficient against the background. Otherwise, use system color.
     * @type {Integer (Int32)}
     */
    static USE_SYSTEM_COLORS_WHEN_NECESSARY => 0

    /**
     * For standard strokes, use system color.
 * 
 * For highlighter strokes, use system highlighter color.
     * @type {Integer (Int32)}
     */
    static USE_SYSTEM_COLORS => 1

    /**
     * For standard strokes, use the selected color.
 * 
 * For highlighter strokes, use the selected color.
     * @type {Integer (Int32)}
     */
    static USE_ORIGINAL_COLORS => 2
}
