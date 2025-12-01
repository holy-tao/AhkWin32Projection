#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The edge mode for the Border effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_border_edge_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_BORDER_EDGE_MODE extends Win32Enum{

    /**
     * Repeats the pixels from the edges of the image.
     * @type {Integer (Int32)}
     */
    static D2D1_BORDER_EDGE_MODE_CLAMP => 0

    /**
     * Uses pixels from the opposite end edge of the image.
     * @type {Integer (Int32)}
     */
    static D2D1_BORDER_EDGE_MODE_WRAP => 1

    /**
     * Reflects pixels about the edge of the image.
     * @type {Integer (Int32)}
     */
    static D2D1_BORDER_EDGE_MODE_MIRROR => 2
}
