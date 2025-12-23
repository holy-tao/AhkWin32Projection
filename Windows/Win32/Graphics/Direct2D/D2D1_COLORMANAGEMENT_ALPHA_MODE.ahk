#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates how the Color management effect should interpret alpha data that is contained in the input image.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_colormanagement_alpha_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_COLORMANAGEMENT_ALPHA_MODE extends Win32Enum{

    /**
     * The effect assumes the alpha mode is premultiplied.
     * @type {Integer (Int32)}
     */
    static D2D1_COLORMANAGEMENT_ALPHA_MODE_PREMULTIPLIED => 1

    /**
     * The effect assumes the alpha mode is straight.
     * @type {Integer (Int32)}
     */
    static D2D1_COLORMANAGEMENT_ALPHA_MODE_STRAIGHT => 2
}
