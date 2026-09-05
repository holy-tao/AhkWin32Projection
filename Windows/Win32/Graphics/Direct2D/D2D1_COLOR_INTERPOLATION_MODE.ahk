#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines how to interpolate between colors.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ne-d2d1_1-d2d1_color_interpolation_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_COLOR_INTERPOLATION_MODE extends Win32Enum {

    /**
     * Colors are interpolated with straight alpha.
     * Native name: D2D1_COLOR_INTERPOLATION_MODE_STRAIGHT
     * @type {Integer (Int32)}
     */
    static STRAIGHT => 0

    /**
     * Colors are interpolated with premultiplied alpha.
     * Native name: D2D1_COLOR_INTERPOLATION_MODE_PREMULTIPLIED
     * @type {Integer (Int32)}
     */
    static PREMULTIPLIED => 1
}
