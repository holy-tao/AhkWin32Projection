#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DWM_WINDOW_CORNER_PREFERENCE enumeration (dwmapi.h) specifies the rounded corner preference for a window.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/dwmapi/ne-dwmapi-dwm_window_corner_preference
 * @namespace Windows.Win32.Graphics.Dwm
 * @version v4.0.30319
 */
class DWM_WINDOW_CORNER_PREFERENCE extends Win32Enum{

    /**
     * Let the system decide when to round window corners.
     * @type {Integer (Int32)}
     */
    static DWMWCP_DEFAULT => 0

    /**
     * Never round window corners.
     * @type {Integer (Int32)}
     */
    static DWMWCP_DONOTROUND => 1

    /**
     * Round the corners, if appropriate.
     * @type {Integer (Int32)}
     */
    static DWMWCP_ROUND => 2

    /**
     * Round the corners if appropriate, with a small radius.
     * @type {Integer (Int32)}
     */
    static DWMWCP_ROUNDSMALL => 3
}
