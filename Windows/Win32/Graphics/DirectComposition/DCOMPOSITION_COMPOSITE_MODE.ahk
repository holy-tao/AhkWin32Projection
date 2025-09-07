#Requires AutoHotkey v2.0.0 64-bit

/**
 * The mode to use to blend the bitmap content of a visual with the render target.
 * @remarks
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
  * If you want a visual to be drawn with antialiasing, use <a href="https://docs.microsoft.com/windows/desktop/api/dcomptypes/ne-dcomptypes-dcomposition_bitmap_interpolation_mode">DCOMPOSITION_BITMAP_INTERPOLATION_MODE_LINEAR</a> for the content of the visual, and <a href="https://docs.microsoft.com/windows/desktop/api/dcomptypes/ne-dcomptypes-dcomposition_border_mode">DCOMPOSITION_BORDER_MODE_SOFT</a> for the edges.
 * @see https://learn.microsoft.com/windows/win32/api/dcomptypes/ne-dcomptypes-dcomposition_composite_mode
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class DCOMPOSITION_COMPOSITE_MODE{

    /**
     * The standard source-over-destination blend mode.
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_COMPOSITE_MODE_SOURCE_OVER => 0

    /**
     * The bitmap colors are inverted.
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_COMPOSITE_MODE_DESTINATION_INVERT => 1

    /**
     * Bitmap colors subtract for color channels in the background.
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_COMPOSITE_MODE_MIN_BLEND => 2

    /**
     * Bitmaps are blended according to the mode established by the parent visual.
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_COMPOSITE_MODE_INHERIT => -1
}
