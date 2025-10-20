#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/dwmapi/ne-dwmapi-dwm_window_corner_preference
 * @namespace Windows.Win32.Graphics.Dwm
 * @version v4.0.30319
 */
class DWM_WINDOW_CORNER_PREFERENCE{

    /**
     * @type {Integer (Int32)}
     */
    static DWMWCP_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static DWMWCP_DONOTROUND => 1

    /**
     * @type {Integer (Int32)}
     */
    static DWMWCP_ROUND => 2

    /**
     * @type {Integer (Int32)}
     */
    static DWMWCP_ROUNDSMALL => 3
}
