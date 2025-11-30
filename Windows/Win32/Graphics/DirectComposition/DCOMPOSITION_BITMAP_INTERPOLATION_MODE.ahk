#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the interpolation mode to be used when a bitmap is composed with any transform where the pixels in the bitmap don't line up exactly one-to-one with pixels on screen.
 * @remarks
 * 
 * The default interpolation mode for a visual is <b>DCOMPOSITION_BITMAP_INTERPOLATION_MODE_INHERIT</b>. If all visuals in a visual tree specify this mode, the default for all visuals is nearest neighbor sampling, which is the fastest mode.
 * 
 * A single visual can have any combination of visual properties. However, if a 
 * visual has the following combination of properties, the borders of the visual will default 
 * to <a href="https://docs.microsoft.com/windows/desktop/api/dcomptypes/ne-dcomptypes-dcomposition_border_mode">DCOMPOSITION_BORDER_MODE_HARD</a>.
 * 
 * 
 * 
 * <ul>
 * <li><code>SetCompositeMode(DCOMPOSITION_COMPOSITE_MODE_DESTINATION_INVERT)
 * </code></li>
 * <li><code>SetBorderMode(DCOMPOSITION_BORDER_MODE_SOFT) 
 * </code></li>
 * <li><c>SetBitmapInterpolationMode(DCOMPOSITION_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR)</c></li>
 * </ul>
 * If you want a visual to be drawn with antialiasing, use <b>DCOMPOSITION_BITMAP_INTERPOLATION_MODE_LINEAR</b> for the content of the visual, and <a href="https://docs.microsoft.com/windows/desktop/api/dcomptypes/ne-dcomptypes-dcomposition_border_mode">DCOMPOSITION_BORDER_MODE_SOFT</a> for the edges.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dcomptypes/ne-dcomptypes-dcomposition_bitmap_interpolation_mode
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class DCOMPOSITION_BITMAP_INTERPOLATION_MODE extends Win32Enum{

    /**
     * Bitmaps are interpolated by using nearest-neighbor sampling.
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR => 0

    /**
     * Bitmaps are interpolated by using linear sampling.
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_BITMAP_INTERPOLATION_MODE_LINEAR => 1

    /**
     * Bitmaps are interpolated according to the mode established by the parent visual.
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_BITMAP_INTERPOLATION_MODE_INHERIT => -1
}
