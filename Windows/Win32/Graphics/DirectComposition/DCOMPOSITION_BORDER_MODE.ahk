#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the border mode to use when composing a bitmap or applying a clip with any transform such that the edges of the bitmap or clip are not axis-aligned with integer coordinates.
 * @remarks
 * 
  * The default border mode for any given visual is <b>DCOMPOSITION_BORDER_MODE_INHERIT</b>, which delegates the determination of the border mode to the parent visual. If all visuals in a visual tree specify this mode, the default for all visuals is aliased rendering, which is the fastest mode.
  * 
  * A single visual can have any combination of visual properties. However, if a 
  * visual has the following combination of properties, the borders of the visual will default 
  * to <b>DCOMPOSITION_BORDER_MODE_HARD</b>.
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
  * If you want a visual to be drawn with antialiasing, use <a href="https://docs.microsoft.com/windows/desktop/api/dcomptypes/ne-dcomptypes-dcomposition_bitmap_interpolation_mode">DCOMPOSITION_BITMAP_INTERPOLATION_MODE_LINEAR</a> for the content of the visual, and <b>DCOMPOSITION_BORDER_MODE_SOFT</b> for the edges.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dcomptypes/ne-dcomptypes-dcomposition_border_mode
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class DCOMPOSITION_BORDER_MODE{

    /**
     * Bitmap and clip edges are antialiased.
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_BORDER_MODE_SOFT => 0

    /**
     * Bitmap and clip edges are aliased. See Remarks.
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_BORDER_MODE_HARD => 1

    /**
     * Bitmap and clip edges are drawn according to the mode established by the parent visual.
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_BORDER_MODE_INHERIT => -1
}
