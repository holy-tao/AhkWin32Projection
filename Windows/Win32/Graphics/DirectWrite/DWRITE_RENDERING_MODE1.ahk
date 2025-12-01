#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how glyphs are rendered.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_rendering_mode1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_RENDERING_MODE1 extends Win32Enum{

    /**
     * Specifies that the rendering mode is determined automatically, based on the font and size.
     * @type {Integer (Int32)}
     */
    static DWRITE_RENDERING_MODE1_DEFAULT => 0

    /**
     * Specifies that no anti-aliasing is performed. Each pixel is either set to the foreground color of the text or retains the color of the background.
     * @type {Integer (Int32)}
     */
    static DWRITE_RENDERING_MODE1_ALIASED => 1

    /**
     * Specifies that antialiasing is performed in the horizontal direction and the appearance of glyphs is layout-compatible with GDI using CLEARTYPE_QUALITY. 
     *             Use DWRITE_MEASURING_MODE_GDI_CLASSIC to get glyph advances. The antialiasing may be either ClearType or grayscale depending on the text antialiasing mode.
     * @type {Integer (Int32)}
     */
    static DWRITE_RENDERING_MODE1_GDI_CLASSIC => 2

    /**
     * Specifies that antialiasing is performed in the horizontal direction and the appearance of glyphs is layout-compatible with GDI using CLEARTYPE_NATURAL_QUALITY. 
     *           Glyph advances are close to the font design advances, but are still rounded to whole pixels. Use DWRITE_MEASURING_MODE_GDI_NATURAL to get glyph advances. 
     *           The antialiasing may be either ClearType or grayscale depending on the text antialiasing mode.
     * @type {Integer (Int32)}
     */
    static DWRITE_RENDERING_MODE1_GDI_NATURAL => 3

    /**
     * Specifies that antialiasing is performed in the horizontal direction. This rendering mode allows glyphs to be positioned with subpixel precision and 
     *             is therefore suitable for natural (i.e., resolution-independent) layout. 
     *             The antialiasing may be either ClearType or grayscale depending on the text antialiasing mode.
     * @type {Integer (Int32)}
     */
    static DWRITE_RENDERING_MODE1_NATURAL => 4

    /**
     * Similar to natural mode except that antialiasing is performed in both the horizontal and vertical directions. 
     *           This is typically used at larger sizes to make curves and diagonal lines look smoother. 
     *           The antialiasing may be either ClearType or grayscale depending on the text antialiasing mode.
     * @type {Integer (Int32)}
     */
    static DWRITE_RENDERING_MODE1_NATURAL_SYMMETRIC => 5

    /**
     * Specifies that rendering should bypass the rasterizer and use the outlines directly. This is typically used at very large sizes.
     * @type {Integer (Int32)}
     */
    static DWRITE_RENDERING_MODE1_OUTLINE => 6

    /**
     * Similar to natural symmetric mode except that when possible, text should be rasterized in a downsampled form.
     * @type {Integer (Int32)}
     */
    static DWRITE_RENDERING_MODE1_NATURAL_SYMMETRIC_DOWNSAMPLED => 7
}
