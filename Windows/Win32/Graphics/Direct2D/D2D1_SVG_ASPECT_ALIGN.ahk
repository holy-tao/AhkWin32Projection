#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The alignment portion of the SVG preserveAspectRatio attribute.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/ne-d2d1svg-d2d1_svg_aspect_align
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_SVG_ASPECT_ALIGN extends Win32Enum {

    /**
     * The alignment is set to SVG's 'none' value.
     * Native name: D2D1_SVG_ASPECT_ALIGN_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The alignment is set to SVG's 'xMinYMin' value.
     * Native name: D2D1_SVG_ASPECT_ALIGN_X_MIN_Y_MIN
     * @type {Integer (Int32)}
     */
    static X_MIN_Y_MIN => 1

    /**
     * The alignment is set to SVG's 'xMidYMin' value.
     * Native name: D2D1_SVG_ASPECT_ALIGN_X_MID_Y_MIN
     * @type {Integer (Int32)}
     */
    static X_MID_Y_MIN => 2

    /**
     * The alignment is set to SVG's 'xMaxYMin' value.
     * Native name: D2D1_SVG_ASPECT_ALIGN_X_MAX_Y_MIN
     * @type {Integer (Int32)}
     */
    static X_MAX_Y_MIN => 3

    /**
     * The alignment is set to SVG's 'xMinYMid' value.
     * Native name: D2D1_SVG_ASPECT_ALIGN_X_MIN_Y_MID
     * @type {Integer (Int32)}
     */
    static X_MIN_Y_MID => 4

    /**
     * The alignment is set to SVG's 'xMidYMid' value.
     * Native name: D2D1_SVG_ASPECT_ALIGN_X_MID_Y_MID
     * @type {Integer (Int32)}
     */
    static X_MID_Y_MID => 5

    /**
     * The alignment is set to SVG's 'xMaxYMid' value.
     * Native name: D2D1_SVG_ASPECT_ALIGN_X_MAX_Y_MID
     * @type {Integer (Int32)}
     */
    static X_MAX_Y_MID => 6

    /**
     * The alignment is set to SVG's 'xMinYMax' value.
     * Native name: D2D1_SVG_ASPECT_ALIGN_X_MIN_Y_MAX
     * @type {Integer (Int32)}
     */
    static X_MIN_Y_MAX => 7

    /**
     * The alignment is set to SVG's 'xMidYMax' value.
     * Native name: D2D1_SVG_ASPECT_ALIGN_X_MID_Y_MAX
     * @type {Integer (Int32)}
     */
    static X_MID_Y_MAX => 8

    /**
     * The alignment is set to SVG's 'xMaxYMax' value.
     * Native name: D2D1_SVG_ASPECT_ALIGN_X_MAX_Y_MAX
     * @type {Integer (Int32)}
     */
    static X_MAX_Y_MAX => 9
}
