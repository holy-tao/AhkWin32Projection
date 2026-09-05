#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines options that should be applied to the color space.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ne-d2d1_1-d2d1_color_space
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_COLOR_SPACE extends Win32Enum {

    /**
     * The color space is otherwise described, such as with a color profile.
     * Native name: D2D1_COLOR_SPACE_CUSTOM
     * @type {Integer (Int32)}
     */
    static CUSTOM => 0

    /**
     * The color space is sRGB.
     * Native name: D2D1_COLOR_SPACE_SRGB
     * @type {Integer (Int32)}
     */
    static SRGB => 1

    /**
     * The color space is scRGB.
     * Native name: D2D1_COLOR_SPACE_SCRGB
     * @type {Integer (Int32)}
     */
    static SCRGB => 2
}
