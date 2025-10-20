#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/dwmapi/ne-dwmapi-dwm_showcontact
 * @namespace Windows.Win32.Graphics.Dwm
 * @version v4.0.30319
 */
class DWM_SHOWCONTACT{

    /**
     * @type {Integer (UInt32)}
     */
    static DWMSC_DOWN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DWMSC_UP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DWMSC_DRAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DWMSC_HOLD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DWMSC_PENBARREL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DWMSC_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DWMSC_ALL => 4294967295
}
