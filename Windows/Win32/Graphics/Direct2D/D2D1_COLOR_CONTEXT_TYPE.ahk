#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies which way a color profile is defined.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/ne-d2d1_3-d2d1_color_context_type
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_COLOR_CONTEXT_TYPE{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D2D1_COLOR_CONTEXT_TYPE_ICC => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D2D1_COLOR_CONTEXT_TYPE_SIMPLE => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D2D1_COLOR_CONTEXT_TYPE_DXGI => 2
}
