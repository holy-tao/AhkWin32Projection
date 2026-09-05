#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The meetOrSlice portion of the SVG preserveAspectRatio attribute.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/ne-d2d1svg-d2d1_svg_aspect_scaling
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_SVG_ASPECT_SCALING extends Win32Enum {

    /**
     * Scale the viewBox up as much as possible such that the entire viewBox is visible within the viewport.
     * Native name: D2D1_SVG_ASPECT_SCALING_MEET
     * @type {Integer (Int32)}
     */
    static MEET => 0

    /**
     * Scale the viewBox down as much as possible such that the entire viewport is
     *           covered by the viewBox.
     * Native name: D2D1_SVG_ASPECT_SCALING_SLICE
     * @type {Integer (Int32)}
     */
    static SLICE => 1
}
