#Requires AutoHotkey v2.0.0 64-bit

/**
 * The meetOrSlice portion of the SVG preserveAspectRatio attribute.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/ne-d2d1svg-d2d1_svg_aspect_scaling
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SVG_ASPECT_SCALING{

    /**
     * Scale the viewBox up as much as possible such that the entire viewBox is visible within the viewport.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ASPECT_SCALING_MEET => 0

    /**
     * Scale the viewBox down as much as possible such that the entire viewport is
 *           covered by the viewBox.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ASPECT_SCALING_SLICE => 1
}
