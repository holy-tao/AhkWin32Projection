#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/dwmapi/ne-dwmapi-dwm_systembackdrop_type
 * @namespace Windows.Win32.Graphics.Dwm
 * @version v4.0.30319
 */
class DWM_SYSTEMBACKDROP_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static DWMSBT_AUTO => 0

    /**
     * @type {Integer (Int32)}
     */
    static DWMSBT_NONE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DWMSBT_MAINWINDOW => 2

    /**
     * @type {Integer (Int32)}
     */
    static DWMSBT_TRANSIENTWINDOW => 3

    /**
     * @type {Integer (Int32)}
     */
    static DWMSBT_TABBEDWINDOW => 4
}
