#Requires AutoHotkey v2.0.0 64-bit

/**
 * The alignment portion of the SVG preserveAspectRatio attribute.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/ne-d2d1svg-d2d1_svg_aspect_align
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SVG_ASPECT_ALIGN{

    /**
     * The alignment is set to SVG's 'none' value.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ASPECT_ALIGN_NONE => 0

    /**
     * The alignment is set to SVG's 'xMinYMin' value.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ASPECT_ALIGN_X_MIN_Y_MIN => 1

    /**
     * The alignment is set to SVG's 'xMidYMin' value.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ASPECT_ALIGN_X_MID_Y_MIN => 2

    /**
     * The alignment is set to SVG's 'xMaxYMin' value.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ASPECT_ALIGN_X_MAX_Y_MIN => 3

    /**
     * The alignment is set to SVG's 'xMinYMid' value.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ASPECT_ALIGN_X_MIN_Y_MID => 4

    /**
     * The alignment is set to SVG's 'xMidYMid' value.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ASPECT_ALIGN_X_MID_Y_MID => 5

    /**
     * The alignment is set to SVG's 'xMaxYMid' value.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ASPECT_ALIGN_X_MAX_Y_MID => 6

    /**
     * The alignment is set to SVG's 'xMinYMax' value.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ASPECT_ALIGN_X_MIN_Y_MAX => 7

    /**
     * The alignment is set to SVG's 'xMidYMax' value.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ASPECT_ALIGN_X_MID_Y_MAX => 8

    /**
     * The alignment is set to SVG's 'xMaxYMax' value.
     * @type {Integer (Int32)}
     */
    static D2D1_SVG_ASPECT_ALIGN_X_MAX_Y_MAX => 9
}
