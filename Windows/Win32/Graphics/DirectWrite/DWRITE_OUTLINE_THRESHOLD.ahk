#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DWRITE_OUTLINE_THRESHOLD enumeration contains values that specify the policy used by the IDWriteFontFace1::GetRecommendedRenderingMode method to determine whether to render glyphs in outline mode.
 * @remarks
 * 
 * Glyphs are rendered in outline mode by default at large sizes for performance reasons, but how large (that is, the outline threshold) depends on the quality of outline rendering. If the graphics system renders anti-aliased outlines, a relatively low threshold is used. But if the graphics system renders aliased outlines, a much higher threshold is used.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/ne-dwrite_1-dwrite_outline_threshold
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_OUTLINE_THRESHOLD{

    /**
     * Graphics system renders anti-aliased outlines.
     * @type {Integer (Int32)}
     */
    static DWRITE_OUTLINE_THRESHOLD_ANTIALIASED => 0

    /**
     * Graphics system renders aliased outlines.
     * @type {Integer (Int32)}
     */
    static DWRITE_OUTLINE_THRESHOLD_ALIASED => 1
}
