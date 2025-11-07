#Requires AutoHotkey v2.0.0 64-bit

/**
 * The SmoothingMode enumeration specifies the type of smoothing (antialiasing) that is applied to lines and curves. This enumeration is used by the Graphics::GetSmoothingMode and Graphics::SetSmoothingMode methods of the Graphics class.
 * @remarks
 * 
 * Smoothing performed by an 8 X 4 box filter gives better results for nearly vertical lines than it does for nearly horizontal lines. Smoothing performed by an 8 X 8 box filter gives equally good results for nearly vertical and nearly horizontal lines. The 8x8 algorithm produces higher quality smoothing but is slower than the 8 X 4 algorithm.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-smoothingmode
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class SmoothingMode{

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static SmoothingModeInvalid => -1

    /**
     * Specifies that smoothing is not applied.
     * @type {Integer (Int32)}
     */
    static SmoothingModeDefault => 0

    /**
     * Specifies that smoothing is not applied.
     * @type {Integer (Int32)}
     */
    static SmoothingModeHighSpeed => 1

    /**
     * Specifies that smoothing is applied using an 8 X 4 box filter.
     * @type {Integer (Int32)}
     */
    static SmoothingModeHighQuality => 2

    /**
     * Specifies that smoothing is not applied.
     * @type {Integer (Int32)}
     */
    static SmoothingModeNone => 3

    /**
     * Specifies that smoothing is applied using an 8 X 4 box filter.
     * @type {Integer (Int32)}
     */
    static SmoothingModeAntiAlias => 4

    /**
     * Specifies that smoothing is applied using an 8 X 4 box filter.
     * @type {Integer (Int32)}
     */
    static SmoothingModeAntiAlias8x4 => 4

    /**
     * Specifies that smoothing is applied using an 8 X 8 box filter.
     * @type {Integer (Int32)}
     */
    static SmoothingModeAntiAlias8x8 => 5
}
