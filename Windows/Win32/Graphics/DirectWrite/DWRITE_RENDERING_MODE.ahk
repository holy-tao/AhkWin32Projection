#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents a method of rendering glyphs.
 * @remarks
 * 
 * <h3><a id="DWRITE_RENDERING_MODE_previous_to_Windows_8"></a><a id="dwrite_rendering_mode_previous_to_windows_8"></a><a id="DWRITE_RENDERING_MODE_PREVIOUS_TO_WINDOWS_8"></a>DWRITE_RENDERING_MODE previous to Windows 8</h3>
 * 
 * <pre class="syntax">enum DWRITE_RENDERING_MODE {
 *   DWRITE_RENDERING_MODE_DEFAULT, 
 *   DWRITE_RENDERING_MODE_ALIASED, 
 *   DWRITE_RENDERING_MODE_CLEARTYPE_GDI_CLASSIC, 
 *   DWRITE_RENDERING_MODE_CLEARTYPE_GDI_NATURAL, 
 *   DWRITE_RENDERING_MODE_CLEARTYPE_NATURAL, 
 *   DWRITE_RENDERING_MODE_CLEARTYPE_NATURAL_SYMMETRIC, 
 *   DWRITE_RENDERING_MODE_OUTLINE 
 * 
 * };</pre>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/ne-dwrite-dwrite_rendering_mode
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_RENDERING_MODE{

    /**
     * Specifies that the rendering mode is determined automatically, based on the font and size.
     * @type {Integer (Int32)}
     */
    static DWRITE_RENDERING_MODE_DEFAULT => 0

    /**
     * Specifies that no anti-aliasing is performed. Each pixel is either set to the foreground color of the text or retains the color of the background.
     * @type {Integer (Int32)}
     */
    static DWRITE_RENDERING_MODE_ALIASED => 1

    /**
     * Specifies that antialiasing is performed in the horizontal direction and the appearance of glyphs is layout-compatible with GDI using CLEARTYPE_QUALITY.
     *             Use DWRITE_MEASURING_MODE_GDI_CLASSIC to get glyph advances. The antialiasing may be either ClearType or grayscale depending on the text antialiasing mode.
     * @type {Integer (Int32)}
     */
    static DWRITE_RENDERING_MODE_GDI_CLASSIC => 2

    /**
     * Specifies that antialiasing is performed in the horizontal direction and the appearance of glyphs is layout-compatible with GDI using CLEARTYPE_NATURAL_QUALITY.
     *           Glyph advances are close to the font design advances, but are still rounded to whole pixels. Use DWRITE_MEASURING_MODE_GDI_NATURAL to get glyph advances. 
     *           The antialiasing may be either ClearType or grayscale depending on the text antialiasing mode.
     * @type {Integer (Int32)}
     */
    static DWRITE_RENDERING_MODE_GDI_NATURAL => 3

    /**
     * Specifies that antialiasing is performed in the horizontal direction. This rendering mode allows glyphs to be positioned with subpixel precision and 
     *             is therefore suitable
     *             for natural (i.e., resolution-independent) layout. The antialiasing may be either ClearType or grayscale depending on the text antialiasing mode.
     * @type {Integer (Int32)}
     */
    static DWRITE_RENDERING_MODE_NATURAL => 4

    /**
     * Similar to natural mode except that antialiasing is performed in both the horizontal and vertical directions. 
     *           This is typically used at larger sizes to make curves and diagonal lines look smoother. The antialiasing may be either ClearType or grayscale depending 
     *           on the text antialiasing mode.
     * @type {Integer (Int32)}
     */
    static DWRITE_RENDERING_MODE_NATURAL_SYMMETRIC => 5

    /**
     * Specifies that rendering should bypass the rasterizer and use the outlines directly. This is typically used at very large sizes.
     * @type {Integer (Int32)}
     */
    static DWRITE_RENDERING_MODE_OUTLINE => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DWRITE_RENDERING_MODE_CLEARTYPE_GDI_CLASSIC => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DWRITE_RENDERING_MODE_CLEARTYPE_GDI_NATURAL => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DWRITE_RENDERING_MODE_CLEARTYPE_NATURAL => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DWRITE_RENDERING_MODE_CLEARTYPE_NATURAL_SYMMETRIC => 5
}
